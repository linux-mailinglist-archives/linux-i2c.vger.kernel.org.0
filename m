Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D612F1A9D
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 17:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731691AbhAKQMK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 11:12:10 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:48859 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730599AbhAKQMK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 11:12:10 -0500
X-Greylist: delayed 380 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Jan 2021 11:12:08 EST
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E88673F1FD;
        Mon, 11 Jan 2021 17:04:50 +0100 (CET)
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-8-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <6cc90f43-f2c8-85f7-3d1c-f96468aab196@somainline.org>
Date:   Mon, 11 Jan 2021 17:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111151651.1616813-8-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

looks like sdm845-cheza also uses the spi0 bus, which as far as I understand is going to break with the GPI DMA disabled. Perhaps it should also be enabled over there?

Actually, is there a point in disabling DMA for BLSPs/QUPs in the SoC DTSI? I don't think any platform/vendor firmware disables entire hosts..


Konrad

