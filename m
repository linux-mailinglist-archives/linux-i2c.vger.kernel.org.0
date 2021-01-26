Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7CB305CF1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Jan 2021 14:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313297AbhAZWiQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 17:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388455AbhAZTHB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jan 2021 14:07:01 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88298C061574;
        Tue, 26 Jan 2021 11:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zUcP2Ekow40wDr8LQu56g1JOWBLSxsWCwNUDwttWnJY=; b=ad84LgFWJ8FgdoRvBSNVnAdb+
        0I6Sw5zFHnURG6DddKEQ8HbimmJVGhfZNBE+p4AhrkuGcqgL8wXJS/82Ulh3PCv17KG3N45R7A4lo
        nmAWv3AnHF/mSc9xZD1jBN9qCv/KUXD01csQwhWLG+rkGDTkxKX1bLlQ1gn5TyX5Nq4qryobh41F5
        DB4HHmb9nD2Xu3mV8TLNo+8B+nWoKTBy48lo4Q1JucKdB4IQ7QCREGM7mwYt646OKNjClWNUO1E6M
        j60U9ebf7BAEOHy7IwgCDiy4Xjl4pjGwcbLID7o2kdNIzvVrdpvSEcEUXs6vOb5LBBAMtPHo30HE4
        oAMpwR9Vw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53070)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1l4TeW-0004lN-0N; Tue, 26 Jan 2021 19:05:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1l4TeJ-00042E-C4; Tue, 26 Jan 2021 19:05:11 +0000
Date:   Tue, 26 Jan 2021 19:05:11 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-rtc@vger.kernel.org,
        kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-serial@vger.kernel.org, coresight@lists.linaro.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de, Leo Yan <leo.yan@linaro.org>,
        dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
Message-ID: <20210126190511.GK1551@shell.armlinux.org.uk>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
 <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
 <20210126175652.3caoqfnsky2es42f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126175652.3caoqfnsky2es42f@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 26, 2021 at 06:56:52PM +0100, Uwe Kleine-König wrote:
> I'm surprised to see that the remove callback introduced in 2952ecf5df33
> ("coresight: etm4x: Refactor probing routine") has an __exit annotation.

In general, remove callbacks should not have an __exit annotation.
__exit _can_ be discarded at link time for built-in stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
