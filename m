Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E383D6E68D2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 18:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjDRQBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 12:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjDRQBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 12:01:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772BED325;
        Tue, 18 Apr 2023 09:01:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C42AD63634;
        Tue, 18 Apr 2023 16:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69FEC433D2;
        Tue, 18 Apr 2023 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681833666;
        bh=4h+zj3kmNreJRwTJjUArKQpjEjIzndIlTtS1qJbGtbw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tqJPbRlBetahZ+VgBgVKNGPyQf5+ZI7gMEyhAsKeW9LzrA9JBB4GP9F63rMC0f4T3
         hBN4Ar8Oqsel/qn+pV+V30XSwGgwy+565SDGBob3IpfpUn6cj3E3pd9AjZAfYu4RTV
         a7L4XjObOyPj/K/CRqQaJYLBP3V72Pt7lm579HGtSRngHW30NAmCMRdXp45ms+lifJ
         tnkMeXlD5jg8YGvu5JAT5aHGKUFwTCJFcRyesVKFRBBbA1/6u74OlxoLNIdm+bstS5
         oSWc4o0mjXe6fwyzB7uQN0DWqZdJzxap8SQlu/G3GvTaaPbr190CwDxHPcjqj0Hn26
         lf6qdDhZVHEJw==
Message-ID: <04d21b26-afb8-3ef8-ce21-f97c1752ea99@kernel.org>
Date:   Tue, 18 Apr 2023 18:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] dt-bindings: i2c: samsung: Fix 'deprecated' value
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418150643.1529895-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230418150643.1529895-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/04/2023 17:06, Rob Herring wrote:
> 'deprecated' is a boolean type which should have a value of 'false' rather

I think you meant 'true'.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> than 'yes'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Best regards,
Krzysztof

