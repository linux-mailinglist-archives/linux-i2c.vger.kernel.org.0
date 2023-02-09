Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE14D68FF0F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 05:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjBIEcf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 23:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjBIEbv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 23:31:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50C343454;
        Wed,  8 Feb 2023 20:31:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 66600B82011;
        Thu,  9 Feb 2023 04:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25387C4339C;
        Thu,  9 Feb 2023 04:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916519;
        bh=YqtN4cgCDLbLJBYdTymQES4kpLGaGbAn/DFmrAartpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jd3wd9OjCOohpCnhuVsCkC7bZh9vX8f86rxq4qWT8kz3rxGHk4YBLrUVSHXOcddrD
         EunQCgUj7iexkmbNgkp+rHVkw11p9pKY0PBf6LlsanpcsIEvEoOil11S0AhBwKrVbg
         zuMdQS5Fk2Z+j3GIUbKxv622Q+xGQ8paVnsujnQ+O7AtdzcnQPH0dqW/q4GpFVu6KG
         a/6AD4eT783Ym07PzgRMgna9ngKSIWC9TGHO74vpoZ+wyX9nEDdvmcWPCqflJJBVgj
         PAwtV9lg5qy6Bz55wnKYvKl+4+ZXvU9zLZQM5zsx/U7CHT6yFaQfNfJHUur7QgJi7C
         CJu3JzXqcNMaA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] Add CCI bus support for SM6350
Date:   Wed,  8 Feb 2023 20:23:15 -0800
Message-Id: <167591660369.1230100.7411524812942379098.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 20 Jan 2023 14:13:43 +0100, Luca Weiss wrote:
> Add the camera clock controller node and CCI nodes to sm6350 dtsi and enable
> the i2c busses on Fairphone 4 dts.
> 
> This is tested using PM8008 regulator patches from the lists which power the
> cameras, and using i2cdetect/i2cget/i2cset reading the sensor ID registers.
> 
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: sm6350: Add camera clock controller
      commit: 4ab96c9c4012770f50f90bda2e61ef774bb63be5
[3/4] arm64: dts: qcom: sm6350: Add CCI nodes
      commit: 033fb15f39b8f092bf4664144784a3e19c834f26
[4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI busses
      commit: bd3dc67bbc34d684c7d94865bb10283508d7cd84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
