Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7BF68A9E2
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 14:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjBDNEt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 08:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbjBDNEs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 08:04:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481A728D08;
        Sat,  4 Feb 2023 05:04:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7991B80ABC;
        Sat,  4 Feb 2023 13:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BCC4339B;
        Sat,  4 Feb 2023 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675515879;
        bh=of02Imc8fZGxu7qVVhjyvr+IGKmXsTV5AYYFyKG1Kyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PHWL/3MmFxPHNLJ7K88OgKi5zhq+5g4DdoTwVbLjt83tuDHxjjD09oGukzQeM0ABQ
         F0LR2AT+k1C7E/eNyeGljv2LPvQ9qRncqIClGGSbcHgnwINnkNfzq97tlK1nl9jtTx
         UJgjeTzQXSPbBnhqozvvlmfvEegZiExgRpCWSICh0Iot48Yu7Lsb2CfTwojAVB9pGU
         ckzK/+wbxSL2DSaW1RnebcnHa2JgTPQlWEldqHd3KDMmG9p7Qxab8/yj+ODmkPFmH4
         7Iov7siQanGVUbZMCwbkInC1ueFFhrlKq59vq/O1orQYyF0JWrM5cUBmN3bATSRmZz
         bj8894Ggbrtiw==
Date:   Sat, 4 Feb 2023 13:04:21 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend 1/3] mfd: intel_soc_pmic_chtwc: Add Lenovo Yoga
 Tab 3 X90F to intel_cht_wc_models
Message-ID: <Y95X1VvzdRcBWbNA@google.com>
References: <20230126153823.22146-1-hdegoede@redhat.com>
 <20230126153823.22146-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126153823.22146-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 Jan 2023, Hans de Goede wrote:

> The drivers for various CHT Whiskey Cove PMIC child-devices need to know
> the model, since they have model specific behavior. The DMI match table
> for this is shared between the child-device-drivers inside the MFD driver.
> 
> Add the Lenovo Yoga Tab 3 X90F, which is a previously unknown tablet
> model with a CHT Whiskey Cove PMIC, to the intel_cht_wc_models enum and
> to the DMI match table.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/intel_soc_pmic_chtwc.c | 8 ++++++++
>  include/linux/mfd/intel_soc_pmic.h | 1 +
>  2 files changed, 9 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
