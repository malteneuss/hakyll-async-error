import Hakyll
import Data.Aeson

--------------------------------------------------------------------------------
main :: IO ()
main = do
  hakyll $ do
    match "content/siteConfig.yaml" $ compile (getResourceString :: Compiler (Item String))

    match "content/post/**" $ do
      route idRoute
      compile $ do
        siteConfig <- load "content/siteConfig.yaml" :: Compiler (Item String)
        siteConfigJson <- getMetadata (itemIdentifier siteConfig)
        -- decode Json and process...
        makeItem ("" ::String)

