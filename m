Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573A65A57DF
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 01:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiH2XrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 19:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiH2Xqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 19:46:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC89FA407A;
        Mon, 29 Aug 2022 16:46:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD388B815A1;
        Mon, 29 Aug 2022 23:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8793CC43140;
        Mon, 29 Aug 2022 23:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816792;
        bh=lnMDKIqHQoq/XIAA3IDppKfWWWZfqPHGgPCGaos8E5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pPIYgj0xJXzehYH7WAUdd0XUQiBr8ziKGVZLsEZZKUtsikBi+R2sKTMuwc1lKSr7Z
         kHG5clKHCkGeCGQfP32Aa7L56r33imi+NEgSJVcJcp5YSWb8wn+4mPRAjG6kfWneO8
         FnZ8GGByhxjlEq+g9JxNegz2/UVZSS2IoLZl/NSpbNfbFxzJLgOmV2ScwG5eS43hFX
         zPYl72g38cSZqkM4rXkRE0TuMWouaTXaxmBhJUDjwxcO624mSQjyVyYtdvsBGAkDE3
         7Mi2ERYS1FgplgOBezn+wnaX5gOY28BTfCpiqXPq9/4FzONf20Kx+yFTWYdeM2u66H
         PKD6AbEGHKLrg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robert.foss@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        loic.poulain@linaro.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org
Cc:     corbet@lwn.net
Subject: Re: (subset) [PATCH 0/5] i2c/arm: dt-bindings: qcom: qcom,i2c-cci: convert to dtschema
Date:   Mon, 29 Aug 2022 18:45:54 -0500
Message-Id: <166181675981.322065.10838450052309212584.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2 Aug 2022 17:39:42 +0200, Krzysztof Kozlowski wrote:
> The DTS patches are independent. Bindings can go via I2C tree, DTS via Qualcomm.
> 
> This is the most northern-patch I created so far: 71°10'21"N 25°47'04"E. Does
> anyone needs a key-signing around? :)
> 
> The place is quite unusual for developing code although its location is
> significant only in personal aspect. The geography does not impute any
> particular importance of the patches. This is just one more small step towards
> better DTS and broader DT schema validation.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sdm845-db845c: drop power-domains from CCI I2C sensors
      commit: 62e60e35309d977eac7f9775574ac01b5c7371fc
[2/5] arm64: dts: qcom: sdm845-db845c: drop gpios from CCI I2C sensors
      commit: a64f7d415281db0b727911de0035809f756b10d7
[3/5] arm64: dts: qcom: use GPIO flags for tlmm
      commit: 36c9d012f193747d42af80b634217addd974c522

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
