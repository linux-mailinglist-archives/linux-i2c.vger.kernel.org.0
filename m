Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03EFB4F9B59
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Apr 2022 19:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbiDHRNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Apr 2022 13:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiDHRNW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Apr 2022 13:13:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54E023BE0;
        Fri,  8 Apr 2022 10:11:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 8129F1F472FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649437876;
        bh=zSX0uHvk16ZFBDSFyoivkyzdt3bDJS/C1eplI/sZW/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XISaaiX+hkZbO2SBKafmiP8WpBpWT93x0pqcJZsuVF5qp3H9YBkh/hP6U0HyBvpUA
         Ff638ip9TPevj74GLN+SHrCSEtxzQxtzEejfr/mPFSx8Ao1eX4C3DWJhOWnYm9ienv
         WKmCTZujYtmPIyVuqZLKqoSNBljXkowi2GnlXwVuali04DUhgjMTTYOLbyeM0+ODyX
         AyMt0SaN8TbyKli2iT1kxNBDNM1ZiNcmX5hvIEOCVepTzH5//JkDkgEdyWgNFcbn0h
         mtN1O3X40C1yHwHsXFqMzDM1zYpRr7MDJNehbddxa4sS0IjuvbRBU3i0eJrU2CS2Sx
         a4ml9iichWuWQ==
Date:   Fri, 8 Apr 2022 13:11:12 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, kernel@collabora.com
Subject: Re: [PATCH] i2c: mediatek: Optimize master_xfer() and avoid circular
 locking
Message-ID: <20220408171112.q7epy6eadha3qixy@notapiano>
References: <20220401120120.7498-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401120120.7498-1-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Angelo,

On Fri, Apr 01, 2022 at 02:01:20PM +0200, AngeloGioacchino Del Regno wrote:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
> 
> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explaination), but it's also suboptimal,

s/explaination/explanation/

> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
> 
> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
> 
> For the sake of providing a full explaination: during probe, the

Ditto.

> clocks are not only prepared but also enabled, as this is needed
> for somehardware initialization but, after that, we are disabling

s/somehardware/some hardware/

> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I couldn't see any performance improvements on mt8192-asurada-spherion with
this, although I didn't do any serious benchmark testing. Besides, on spherion
the TPM is instead wired through SPI, so I guess most of the boot overhead
wouldn't be visible there.

In any case it did get rid of the frequent deadlocks when booting on spherion,
which is already great on its own, so

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
