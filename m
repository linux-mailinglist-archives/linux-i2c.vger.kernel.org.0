Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51265A6464
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 15:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiH3NKJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 09:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiH3NKH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 09:10:07 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AC61AD8F;
        Tue, 30 Aug 2022 06:10:04 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4DEE05C0161;
        Tue, 30 Aug 2022 09:10:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 30 Aug 2022 09:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1661865004; x=
        1661951404; bh=+9S2ly6azi6QK5yxzI1YIvhw2qv6fjY+mHj3WQg30AI=; b=W
        SxKpNk8nv/UScPsSIccAw+9P+VEw/eMJtzsBnv2s1kgc6kUGXs7vaoORkccEcxcH
        EJWc+STG//Zr5K4AzUdSyfsficVDdwiTkSQxbNOlASntm6WRowNGkAJznAoCqINT
        Kf+Rl3khIsN65A43/QF+5v83eVXGZ50LnvPncz54KdbrUi1jzX/ClkIwxS8oRp57
        B+tRhS8fssqxjKSnNJOzB8kp+Jrfvqric3qn7BYm2eKr4FGmw/A1wHHoFTX1vv9v
        kqTfZ60nC3WO72louA9CPCkgK0aMBKXgTZLOLaicnCM1gItt7fsU1uO/i7tgE/h3
        O1LwkrZ/2P7Euh9xWGW6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661865004; x=
        1661951404; bh=+9S2ly6azi6QK5yxzI1YIvhw2qv6fjY+mHj3WQg30AI=; b=X
        oB3xH+4+M6p9uBSloPBmZsU5YX4/g3oD2rO/uDYiP06jVcvfW7wuVyqMVAHjFtGF
        jB4B6MhX5GHB5VvQJtI0tYt3mh5Ew3NYjVtABeCMRMBWNppNujsg3dbfYoXPSdYy
        f4L8iVcKJWrbesWWcrHvBrXDcG/lvB+uxyPL4fPwS5hhltY8Y6r/nshUfDEZ0hKU
        7w8bPn0Lp2SGP8CYw24GXs4bl/5m8KbCkNJKFMGbyImRtG+Cy5FBU74f7mXAmW+9
        EWpRyjgfV67i+rgZ8dFW+03tkG1y8kzg5OzDVZ6A+TuclC1/g7Sp6MMR1RTBLUN3
        3dKgg9HawHZmF/al8to8A==
X-ME-Sender: <xms:KwwOY3QuLu8cBtSSdTo9-SedcFdq4QMNwWqLcSx7Rm8nopWFyS7Z-g>
    <xme:KwwOY4wbTAeISAeljpOJgYo2yUtoRYQnBAOixPirovghOKTyOayQKO_jgP4pR4hTT
    f0TraPiB8iYNUrYVQ>
X-ME-Received: <xmr:KwwOY83al0CiK7Vk21I4vt-7tC40f3V_1X3dQzuu-GUQTOJ3dxFCel51wZXis6bkM6tNt76xNhjFiBiMCKcBnvAmvHKYJDKTRQxT93_ezITxTP6eu8JqSfguLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KwwOY3DDG68tNnTlC6vyQexkNbZ0UOwp4k9sTQdW3pha7EAVCMnUEg>
    <xmx:KwwOYwib7Af5efkdVPRSLTuYgy94ghlxTYkKXWXV4OQyTdlotu_nZA>
    <xmx:KwwOY7rOTU8bq-o113n87MK_gzywrUzUywHz8DdShbWAogeY_AbcYQ>
    <xmx:LAwOYzOgaFmUmjRhrM8hzgoVOF1C0D1h_xfzHkCCxydtpZlds138xA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Aug 2022 09:10:03 -0400 (EDT)
Subject: Re: [PATCH 1/3] dt-bindings: i2c: mv64xxx: Document DMA properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220830020824.62288-1-samuel@sholland.org>
 <20220830020824.62288-2-samuel@sholland.org>
 <1c9cb6c2-2030-257d-a50d-dada0ab4449e@linaro.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <7fd702e9-dedc-e5bf-fd54-f07d053b1870@sholland.org>
Date:   Tue, 30 Aug 2022 08:10:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1c9cb6c2-2030-257d-a50d-dada0ab4449e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/30/22 4:36 AM, Krzysztof Kozlowski wrote:
> On 30/08/2022 05:08, Samuel Holland wrote:
>> Allwinner's I2C offload engine includes bidirectional DMA support. Add
>> the properties for describing this in the devicetree. "dmas" is optional
>> because not all instances of the controller have their DRQs hooked up.
>> For example, R_I2C0 and R_I2C1 on V536 have no DRQ number assigned.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> ---
>>
>>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml           | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
>> index 0ec033e48830..63d665a4f9bb 100644
>> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
>> @@ -66,6 +66,19 @@ properties:
>>    resets:
>>      maxItems: 1
>>  
>> +  dmas:
>> +    items:
>> +      - description: RX DMA Channel
>> +      - description: TX DMA Channel
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rx
>> +      - const: tx
>> +
>> +dependencies:
>> +  dmas: [ dma-names ]
> 
> Dependency is not needed. meta-schema has it.

The only dma-names dependencies I see in dtschema (meta-schemas/dma.yaml and
schemas/dma/dma.yaml) are in the other direction. Those are saying that
dma-names only makes sense if dmas is provided.

Here I am saying that the two DMA requests are optional, but only optional
"together". The node must either have no DMA properties or both DMA properties.

Regards,
Samuel
