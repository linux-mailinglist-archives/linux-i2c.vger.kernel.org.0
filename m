Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51AF3109F4
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 12:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhBELKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 06:10:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231403AbhBELHy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 06:07:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C71064E27;
        Fri,  5 Feb 2021 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612523232;
        bh=Nwtz3BUqSevf1s1e0A4/LfXqpax1F3NKU3Zl0rZrhyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z3iM1B16HIK+kzq5DdPhk4pYYltyyjSK8c9ulRSTyKEvO41jovJreH8Xz0RMtHOV2
         ruA/A2WS6VMUHJz0QfdlmNKVJNNXdklaLg6Lm8dDlfDgKTxOW/tbDIbscItS3ul0Kr
         ikt5qpBkp9i1zI8aVEMs6D0Sc58DYFERyojRWtGY=
Date:   Fri, 5 Feb 2021 12:07:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
        kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <YB0m3ecbL2t1JFbw@kroah.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
 <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
 <YB0baUzgvpd+EoO6@kroah.com>
 <20210205105615.qumu45huvntf2v4j@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210205105615.qumu45huvntf2v4j@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 05, 2021 at 11:56:15AM +0100, Uwe Kleine-König wrote:
> On Fri, Feb 05, 2021 at 11:18:17AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Feb 05, 2021 at 10:37:44AM +0100, Uwe Kleine-König wrote:
> > > Hello Russell, hello Greg,
> > > 
> > > On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-König wrote:
> > > > On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux admin wrote:
> > > > > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > > > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux admin wrote:
> > > > > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > > > > > > > I'm glad to take this through my char/misc tree, as that's where the
> > > > > > > > other coresight changes flow through.  So if no one else objects, I will
> > > > > > > > do so...
> > > > > > > 
> > > > > > > Greg, did you end up pulling this after all? If not, Uwe produced a v2.
> > > > > > > I haven't merged v2 yet as I don't know what you've done.
> > > > > > 
> > > > > > I thought you merged this?
> > > > > 
> > > > > I took v1, and put it in a branch I've promised in the past not to
> > > > > rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
> > > > > on top.
> > > > > 
> > > > > The only reason to produce an "immutable" branch is if it's the basis
> > > > > for some dependent work and you need that branch merged into other
> > > > > people's trees... so the whole "lets produce a v2" is really odd
> > > > > workflow... I'm confused about what I should do, and who has to be
> > > > > informed which option I take.
> > > > > 
> > > > > I'm rather lost here too.
> > > > 
> > > > Sorry to have cause this confusion. After I saw that my initial tag
> > > > missed to adapt a driver I wanted to make it easy for you to fix the
> > > > situation.
> > > > So I created a patch to fix it and created a second tag with the patch
> > > > squashed in. Obviously only one of them have to be picked and I hoped
> > > > you (= Russell + Greg) would agree which option to pick.
> > > > 
> > > > My preference would be if you both pick up v2 of the tag to yield a
> > > > history that is bisectable without build problems, but if Russell (who
> > > > already picked up the broken tag) considers his tree immutable and so
> > > > isn't willing to rebase, then picking up the patch is the way to go.
> > > 
> > > OK, the current state is that Russell applied the patch fixing
> > > drivers/mailbox/arm_mhuv2.c on top of merging my first tag.
> > > 
> > > So the way forward now is that Greg pulls
> > > 
> > > 	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable
> > > 
> > > which currently points to 
> > > 
> > > 	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback return void")
> > > 
> > > , into his tree that contains the hwtracing changes that conflict with my
> > > changes. @Greg: Is this good enough, or do you require a dedicated tag
> > > to pull that?
> > > 
> > > I think these conflicting hwtracing changes are not yet in any of Greg's
> > > trees (at least they are not in next).
> > > 
> > > When I pull
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
> > > 
> > > (currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
> > > to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
> > > drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
> > > resolution looks as follows:
> > 
> > Ok, my resolution looked a bit different.
> > 
> > Can you pull my char-misc-testing branch and verify I got this all
> > pulled in correctly?
> 
> minor side-note: mentioning the repo url would have simplified that test.

Sorry, I thought you had it based on the above info.

> I looked at
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> 
> commit 0573d3fa48640f0fa6b105ff92dcb02b94d6c1ab now.
> 
> I didn't compile test, but I'm willing to bet your resolution is wrong.
> You have no return statement in etm4_remove_dev() but its return type is
> int and etm4_remove_amba() still returns int but should return void.

Can you send a patch to fix this up?

thanks,

greg k-h
