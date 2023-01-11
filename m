Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2CF2665353
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 06:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjAKFTO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 00:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjAKFSN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 00:18:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5609713DFB;
        Tue, 10 Jan 2023 21:09:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9C7461A36;
        Wed, 11 Jan 2023 05:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC75C433F0;
        Wed, 11 Jan 2023 05:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413797;
        bh=LBriVWcc5HMoENNMmkbifk2TxYS7s5q23doudMNyFow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CkYWgS4lNne2scdjiRlGeuz0RFYELINsE3ktEuuMuNJA2x9s86VvivaEy8gr4Bu2n
         rgvrQPLQQC1Whgb3O3ua4lKCJ20iDFn9SM0HhlQ9iGWYVu9wuKHLQLlJNu0Fs3QUwS
         gYH3sk/yhkk046OEubj7fBkSUMn5SL+CaAm93yUQSIcN5Qm8Q64lyprmNopp1ctaZV
         L0zIT19tDtasqmXgC3aSDlrdkMaAfEAd48o9M3tvfuut7UFp6v9ZiUAimOfi4/pNpF
         wHjoGAdU0s0onaoK/LQu8dbh+AQh45DKFCDG3vTAJTy+ZgvRVCMXypN5GSvgwsXlAJ
         /XcpflKxhuziw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     linux-i2c@vger.kernel.org, marijn.suijten@somainline.org,
        loic.poulain@linaro.org, devicetree@vger.kernel.org,
        robert.foss@linaro.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: (subset) [PATCH v2 1/6] dt-bindings: i2c: qcom,i2c-cci: Fall back to common compatibles
Date:   Tue, 10 Jan 2023 23:09:22 -0600
Message-Id: <167341377725.2246479.4642389648248724510.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
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

On Tue, 13 Dec 2022 19:33:00 +0100, Konrad Dybcio wrote:
> Almost every compatible string in the CCI driver is a duplicate. Adjust
> the bindings to include a common (first-soc-implementing-vX) compatible
> to remove the need to keep adding superfluous compatible strings.
> 
> 

Applied, thanks!

[2/6] arm64: dts: qcom: msm8916: Add fallback CCI compatible
      commit: 6d88aafa6fdded2a76f60060ea50f7b8e98a2705
[3/6] arm64: dts: qcom: sdm845: Add fallback CCI compatible
      commit: 84c611c5bca41f584a990a041daf31bf73ba9b99
[4/6] arm64: dts: qcom: sm8250: Add fallback CCI compatible
      commit: dd45008b74e4ca28bbacf0d249dac821624a88b0
[5/6] arm64: dts: qcom: sm8450: Add fallback CCI compatible
      commit: 71b7c2df3109ee62e875b16fcb5654e626bf7cc7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
