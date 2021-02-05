Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9476F310B94
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 14:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhBENM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 08:12:26 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:34562 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhBENJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 08:09:59 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id D67A7AED6A1; Fri,  5 Feb 2021 14:08:50 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Takashi Iwai <tiwai@suse.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        alsa-devel@alsa-project.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: [PATCH] coresight: etm4x: Fix merge resolution for amba rework
Date:   Fri,  5 Feb 2021 14:08:47 +0100
Message-Id: <20210205130848.20009-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This was non-trivial to get right because commits
c23bc382ef0e ("coresight: etm4x: Refactor probing routine") and
5214b563588e ("coresight: etm4x: Add support for sysreg only devices")
changed the code flow considerably. With this change the driver can be
built again.

Fixes: 0573d3fa4864 ("Merge branch 'devel-stable' of git://git.armlinux.org.uk/~rmk/linux-arm into char-misc-next")
Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
On Fri, Feb 05, 2021 at 12:07:09PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 05, 2021 at 11:56:15AM +0100, Uwe Kleine-König wrote:
> > I didn't compile test, but I'm willing to bet your resolution is wrong.
> > You have no return statement in etm4_remove_dev() but its return type is
> > int and etm4_remove_amba() still returns int but should return void.
> 
> Can you send a patch to fix this up?

Sure, here it comes. As I'm unsure if you want to squash it into the
merge or want to keep it separate I crafted a commit message. If you
prefer squashing feel free to do so.

This change corresponds to the merge resolution I suggested before.

Best regards
Uwe

 drivers/hwtracing/coresight/coresight-etm4x-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index bc55b261af23..c8ecd91e289e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1906,15 +1906,16 @@ static int __exit etm4_remove_dev(struct etmv4_drvdata *drvdata)
 	cpus_read_unlock();
 
 	coresight_unregister(drvdata->csdev);
+
+	return 0;
 }
 
-static int __exit etm4_remove_amba(struct amba_device *adev)
+static void __exit etm4_remove_amba(struct amba_device *adev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 
 	if (drvdata)
-		return etm4_remove_dev(drvdata);
-	return 0;
+		etm4_remove_dev(drvdata);
 }
 
 static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
-- 
2.29.2

