Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDC868A9F6
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBDNTl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 08:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbjBDNTk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 08:19:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9932E808;
        Sat,  4 Feb 2023 05:19:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE6B660B40;
        Sat,  4 Feb 2023 13:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E5AC433D2;
        Sat,  4 Feb 2023 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675516778;
        bh=kTH6dxHxYcZYenOQQ3u8iRjJX6qruICKizskH77l8wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASUHn1J+d1Ef2+Uk4YkHgncIfkNZGQoLri/0cNeQhFEcvvFi0pfZ/ZWrxQIN5kvI/
         iEh3tXF64CxQKxt4NJ77gBgW/Zf1dNBMNtJaywHqbR538zMomOeeMqmTPoEx7kNopy
         j/HgcYQ5UjTFDGpK6TztEE3uOyl/7KRnkYrEMawiDTh7VUX3LzjMrFZfMCFerbygcB
         q5Owc7zzi1j1igh558zma6uc8MXqebkPolc4UsnWqg8Ww3BHQibOYzxB211CX0TTLN
         XySTxIxhDMTVaYJAiLGqeO/HF97h7ApIRln2tqww64UKKnooKt1soPrZ76K74gPftR
         46O+37LulDdQQ==
Date:   Sat, 4 Feb 2023 13:19:17 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Extcon and I2C due for the
 v6.3 merge window
Message-ID: <Y95bVYc0dXOkJoGd@google.com>
References: <20230126153823.22146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126153823.22146-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enjoy!

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-extcon-i2c-v6.3

for you to fetch changes up to 783422d00d7d8f7725dc781fcd3cfcaae13595e5:

  extcon: intel-cht-wc: Add support for Lenovo Yoga Tab 3 Pro YT3-X90F (2023-02-04 13:05:42 +0000)

----------------------------------------------------------------
Immutable branch between MFD, Extcon and I2C due for the v6.3 merge window

----------------------------------------------------------------
Hans de Goede (3):
      mfd: intel_soc_pmic_chtwc: Add Lenovo Yoga Tab 3 X90F to intel_cht_wc_models
      i2c: cht-wc: Add charger-chip info for the Lenovo Yoga Tab 3 YT3-X90F
      extcon: intel-cht-wc: Add support for Lenovo Yoga Tab 3 Pro YT3-X90F

 drivers/extcon/extcon-intel-cht-wc.c |  1 +
 drivers/i2c/busses/i2c-cht-wc.c      | 46 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/intel_soc_pmic_chtwc.c   |  8 +++++++
 include/linux/mfd/intel_soc_pmic.h   |  1 +
 4 files changed, 56 insertions(+)

-- 
Lee Jones [李琼斯]
