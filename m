Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C216A1BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 13:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjBXMIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 07:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjBXMIx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 07:08:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A745AB76
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 04:08:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq5-0000cM-Ri; Fri, 24 Feb 2023 13:06:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq0-007AzU-T6; Fri, 24 Feb 2023 13:06:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq1-006EYh-8o; Fri, 24 Feb 2023 13:06:09 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 0/9] i2c: Switch .probe() to not take an id parameter
Date:   Fri, 24 Feb 2023 13:05:51 +0100
Message-Id: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8517; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=svyjlYi2kBgEizEYtMO2CISULpk6FKB2KNK+taxddrk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+KgBmqyp+N47ZSh0L9FOSS4eg0gnOSe4S/X7E bAHDF6YYjGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/ioAQAKCRDB/BR4rcrs CXH+CACUPpsNPve/affPJ81SUqj/ELy35w2PDxSfCEduVjYydX01BjiktkFYPORd45EUjiETReo ISWnhtcHaJ6E6ETtyMUc5gWAc/jSDX0Nw0uSSAPAyD+vONA0R7z027Q7BZwrphVoxv6wGQWE1Jw BiFhpq0O9OpvCDrJ+LRNioQ+bkEJi+g+w8iaf0tl6XSPzbi6nU3blOHKpWquOhlB760Vc2pqfA0 CtQ9rJ91RL56gmiHGjmMcTait7oXmdnSC74Y0LKOOiDt+NveRQHhOekECXs0lm0bQwg3/SOY0zq s0kFuJl1AxSy5Wm7930fbOGwqoIJR0BCDKC2tjM3IdTiOAIA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

back in 2016 a conversion was started to drop the id parameter from the
.probe() callback of i2c drivers. This series (somewhat) completes this
quest: As of next-20230224 all but very few drivers are converted to the
temporary .probe_new() callback such that .probe() can be changed
accordingly. There are currently no new drivers in next making use of
the old .probe() callback.

The first 6 patches convert the remaining drivers. Three of them have
their maintainer's ack, I didn't get feedback for the other three.
The Link footer in these patches document the earlier submissions.

The 7th patch changes .probe() to the prototype without the id
parameter. The remaining two patches convert the drivers contained in
the i2c subsystem to the new .probe().

I chose v6.2 as a base for this series but note that there a few more
drivers in there that are still unconverted. Linus Torvalds's tree (as
of d2980d8d826554fa6981d621e569a453787472f8) contains 60 more
conversions after v6.2. In next there is another set of 22 conversions
that are required before this series can go in. My expectation is that
these 82 change sets will be all contained in 6.3-rc1 such that this
series can be applied on top of that tag.

For reference the complete set of patches is available at

	https://git.pengutronix.de/git/ukl/linux i2c-probe-new

I'll rebase that from time to time such that the set of remaining
patches can be checked there.

@Wolfram: It would be great to get this series into next soon after
v6.3-rc1 is published, maybe with a tag for other subsystems to pull.
(This would be required if new drivers want to make use of the new
.probe() callback only.)

I intend to convert all drivers to the new .probe() callback after this
series landed and then eventually drop .probe_new() to complete the
effort.

Best regards
Uwe

Uwe Kleine-König (9):
  misc: ad525x_dpot-i2c: Convert to i2c's .probe_new()
  mtd: maps: pismo: Convert to i2c's .probe_new()
  serial: sc16is7xx: Convert to i2c's .probe_new()
  w1: ds2482: Convert to i2c's .probe_new()
  media: i2c: ov5695: convert to i2c's .probe_new()
  media: i2c: ov2685: convert to i2c's .probe_new()
  i2c: Switch .probe() to not take an id parameter
  i2c: mux: Convert all drivers to new .probe() callback
  i2c: Convert drivers to new .probe() callback

 drivers/i2c/i2c-core-base.c         | 13 +++----------
 drivers/i2c/i2c-slave-eeprom.c      |  2 +-
 drivers/i2c/i2c-slave-testunit.c    |  2 +-
 drivers/i2c/i2c-smbus.c             |  2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c |  2 +-
 drivers/media/i2c/ov2685.c          |  5 ++---
 drivers/media/i2c/ov5695.c          |  5 ++---
 drivers/misc/ad525x_dpot-i2c.c      |  6 +++---
 drivers/mtd/maps/pismo.c            |  5 ++---
 drivers/tty/serial/sc16is7xx.c      |  6 +++---
 drivers/w1/masters/ds2482.c         |  5 ++---
 include/linux/i2c.h                 | 14 +++++++++-----
 14 files changed, 32 insertions(+), 39 deletions(-)


base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
prerequisite-patch-id: 2e7d7db8c0a90b8cd1deb6bbc51ead4c89c89b62
prerequisite-patch-id: 68960e1b9d6064d3a1b5e65699830129e8246a4d
prerequisite-patch-id: 3f2fbc0129a6390cba155106044ea8ef74c17547
prerequisite-patch-id: ad1ad4e8d7be0c055e6258cdb7ff6c6921daebb2
prerequisite-patch-id: 2a5cb71deca2e3980dc30f76defea32d0640c1cc
prerequisite-patch-id: 1acdc555ce5259b31b51b345e9fa28f15cdebd9b
prerequisite-patch-id: 64eff2614a7f3dab745282a1852fee41837c0c59
prerequisite-patch-id: da2168484e5e34e2b9f788f20b7fe9c4c6f24b24
prerequisite-patch-id: 6228c4eccc6e84f3b4fba822f3bddbfd86f5b97b
prerequisite-patch-id: 398c68a80a9647aeea73cdd7852290e1abe4623d
prerequisite-patch-id: e7f7330b18d5ad5b0cc25329325bb24ef7023cec
prerequisite-patch-id: 5a8d299e8285d1725a0b088de6bcf72e972b399c
prerequisite-patch-id: 10d9ee70ff66026de20fc103dd98fe1df36b6d73
prerequisite-patch-id: d91adb87d04d1760d6e79568fcfc2605c623e3cd
prerequisite-patch-id: 5e47e64999246ca2a52dab36754c5c35945bdf90
prerequisite-patch-id: 63c39943b3d6f2e7435f9864b56e7e7a379f0b8d
prerequisite-patch-id: 06376bfa1ea41691206da7f0607d748fabd74f23
prerequisite-patch-id: e984c0d0f267ce186895cdc4f464da3704f2efa9
prerequisite-patch-id: 6d4a24d2821eb225e86024c21b366cb7c2bb7c87
prerequisite-patch-id: 95c7334d368f3a64ab6c7d41440ac4221c316356
prerequisite-patch-id: 83716102d794ceeccad68a8c95dba15ebc97d450
prerequisite-patch-id: 5242684cb9ff2653913164df8e29e7e1c35be1a7
prerequisite-patch-id: 5f4de5c1ab515144141120633810e25d383608fc
prerequisite-patch-id: 396edcd3230e3d18737fa55f71533b4265ba7e5e
prerequisite-patch-id: 2ea5771265eda86b2329d4e9f2c264031254ec2f
prerequisite-patch-id: 660164e81672844768a6caf08450d160b494c0b1
prerequisite-patch-id: 750a5ff9cf0f8ad9bd4dddea74b939e01041de5d
prerequisite-patch-id: d2baa534b684e51e1be3e2d63ee696d87a0be623
prerequisite-patch-id: bc3d769755acfd9d36c1f449428b9c54b35812fb
prerequisite-patch-id: c149de6358e345076ebc240da493f1bf1a508dab
prerequisite-patch-id: 591c093efa389918b5f0adb621e1f4bd6e1adc0e
prerequisite-patch-id: cd7f318600560528aec460e55a452ea0b90ec898
prerequisite-patch-id: 295fa29af26c81c64e7fa6b9244504daa308ee6d
prerequisite-patch-id: f184632401a63479cc8a77b6e9958a279fafa06d
prerequisite-patch-id: 1d01b258df0777934668f5710960c5a2a0f8f3a4
prerequisite-patch-id: a9eafb96ebadff82eafce9843555357a2688c8c9
prerequisite-patch-id: 2ed279b79658d65a13441e2342deb931d5f5b669
prerequisite-patch-id: 3876f1605311328bad00df764927a4164236125a
prerequisite-patch-id: e1522742d247f98b321af3104074c3f82cf67955
prerequisite-patch-id: b268913eee204fae2a3e7779c08df83ce21a6515
prerequisite-patch-id: a4613e66e4de89a87635534e9210d6d1edeb5f7e
prerequisite-patch-id: 824fb91ee278337951fdedaac99432bc753699fe
prerequisite-patch-id: ec4f9a919e45a99b83d52fd9d4fcf42a1f12ef26
prerequisite-patch-id: a95e27ba44f4fc4239d1a62fbe9ff7689d685ff5
prerequisite-patch-id: dba3fc00f472523fab383d79a56c072381ddfe9d
prerequisite-patch-id: f76bf70c077b629b86a65898875e7b552f4db2a4
prerequisite-patch-id: 12a1f88b386c0c05f7a5569637d4c2b798bb8260
prerequisite-patch-id: 4aa1838b3fd22132cca0e6810cf9b33cbe55318b
prerequisite-patch-id: 8dc9c99781af9f341cf2f7872b6cddb70070949c
prerequisite-patch-id: ef47ccfde62411344af4703dcc24959611b85301
prerequisite-patch-id: c7548e392a2e2722140ccab8c6e47fe2c327770f
prerequisite-patch-id: 4f2ccb6f991418021139e11b8c73b901169798f5
prerequisite-patch-id: 88cb2d6e777f60fa6075c4f0f91b46585714dc26
prerequisite-patch-id: 8dbd8552ee97170d1d7c8c655aa1ebde53b97829
prerequisite-patch-id: 1945f551009d075a28ce6da39759c11a4d80d37b
prerequisite-patch-id: 7c7c4bf854e352e316689a6cb3f9e9c04eab7c7e
prerequisite-patch-id: 60f0ae1aa26bbbc699c60b06d97a614432f2e935
prerequisite-patch-id: 5680b5b69bc3feba0e6b4d6baed5fb9d4b1af97e
prerequisite-patch-id: c5644c69ebd0504d0f84d8d671f7157a54da5760
prerequisite-patch-id: 688c306ec00774f734fc675e33606062a19dd50b
prerequisite-patch-id: 77432aab9af85fc9a215443b11f32e10fb504d10
prerequisite-patch-id: ac64c2fdbdc0c483158c157f13d62a98585d02d7
prerequisite-patch-id: 1df528279cfe26308765d0419f98d3c09728715a
prerequisite-patch-id: 80925ce59afc49cd265f3d9b9aa242659514c133
prerequisite-patch-id: 04a21499016b21f8c3ac308dfdc20a49b1d5a741
prerequisite-patch-id: d2e996c3e4b5e7c544e38efe6f6dab43ad0ffb0e
prerequisite-patch-id: 6713e608f82498ec5d174935c2f6c232c2f5e5ff
prerequisite-patch-id: 68d04beedcad14c650a78c8132fb6b9b45205b38
prerequisite-patch-id: 6344e213dec976a90dc275c8a9a166c351d6fe9a
prerequisite-patch-id: 7c01e136bb6e601a80a428037877576f1b342084
prerequisite-patch-id: 9b6b4307c7f53fba00c37971ddbb517cafa22531
prerequisite-patch-id: 09806da1cff3a4924d1ff5045dc17b6b14641d63
prerequisite-patch-id: f143469cfe4d1f94257bbaf5e283daf0ab054f43
prerequisite-patch-id: 021c087e20eb1fbf2cb9b9b99a2c53c892769ba8
prerequisite-patch-id: 4252b2e4fe47331f5bde1f18b44a6ba6c2eb51de
prerequisite-patch-id: 7e5c6557466d39fef01e794ffbec2a3609938573
prerequisite-patch-id: 621dcc5855c64e5402bbe94b2f365f91454618a6
prerequisite-patch-id: 41b9a4aee51447cff810c9e7694b2ccfb74c1ac6
prerequisite-patch-id: eb3c550ee6712b0ff289083dba417804e7f3ce98
prerequisite-patch-id: 6fe10bbbc1913738f093e7deb01bf2f75b64bcec
prerequisite-patch-id: 256857b4eee79540b271b8d4899b9ba0aa3c4c27
prerequisite-patch-id: bb49c9c71311ac1f1056c562f20f26aa356c95a6
-- 
2.39.1

