Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDDF308074
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 22:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhA1VYA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 16:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhA1VYA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 16:24:00 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6921C061574
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 13:23:19 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E880F3ED94;
        Thu, 28 Jan 2021 22:23:15 +0100 (CET)
Subject: Re: [PATCH v3 3/3] dt-bindings: i2c: qcom,i2c-qup: Document noise
 rejection properties
To:     Wolfram Sang <wsa@kernel.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
 <20210114180415.404418-4-angelogioacchino.delregno@somainline.org>
 <20210128091302.GG963@ninjato>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <8091e7fb-5530-10c2-c66c-ac76940ef1ad@somainline.org>
Date:   Thu, 28 Jan 2021 22:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210128091302.GG963@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 28/01/21 10:13, Wolfram Sang ha scritto:
> 
>> +  qcom,noise-reject-sda:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Noise rejection level for the SDA line.
>> +    minimum: 0
>> +    maximum: 3
>> +    default: 0
> 
> What does this u32 describe? I wonder if we can introduce a generic
> property instead of a vendor-specific one.
> 

Describes a "noise rejection level"... zero is disabled, 1-2-3 are
min-med-high. That's what the hardware accepts.

Also, there's no "real" documentation on this, so it wasn't possible
to map it to any real measurement unit as well...
