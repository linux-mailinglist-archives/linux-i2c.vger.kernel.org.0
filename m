Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29D6796B4
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 12:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbjAXLda (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 06:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbjAXLd3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 06:33:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7377A9025;
        Tue, 24 Jan 2023 03:33:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1037460F36;
        Tue, 24 Jan 2023 11:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5EAC4339B;
        Tue, 24 Jan 2023 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674560006;
        bh=pqiKu2iFX77RIfIfiJ+5aMwkbCrMMguxTgKU4tKjUc0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jgG/iA+3jct6fX618SdC2isOsZjWZm850pXEIc4qvAxt/n0eIhCt6KTmRo3zzkL8o
         hJkC9ifX5nG04CmUdkrMj8X1xdCdF9QBCGwpLig5drRUU0hEvDtyZZeHVNHUjPf6Ui
         ibhw6WnPMN4ao6NtsT/Pf/bt39cm5j6kbF4T9ZIZZ12xPDOgfJwMv70aUfZ+eAmPav
         chhJQw+fSLdYqvAmIxK7WfQBAv8yGvwjiGZ398QLL5DSxhhMfeQVeAglmzqCHSyIIx
         1YhxJcQoS7U/O+Z7t0X7McA+2/AIYxmpvUnWfRHPu7tzCWyIuLzJHSzpzhdFVIa3KI
         EvkegYMtxhCZA==
Message-ID: <c15b377a-a07e-c43e-55f2-c0f6dd8cd75f@kernel.org>
Date:   Tue, 24 Jan 2023 12:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V3 7/9] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     git@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
        manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
 <1674536682-25278-8-git-send-email-manikanta.guntupalli@amd.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1674536682-25278-8-git-send-email-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/01/2023 06:04, Manikanta Guntupalli wrote:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed several entries, so this also will mean patch won't get tested.


> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> 
> compatible

Messed up subject and commit msg.

> 
> Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible
> Added clock-frequency as optional property.
> 
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 8d241a703d85..42488a67260c 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -14,7 +14,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: xlnx,xps-iic-2.00.a
> +    enum:
> +      - xlnx,xps-iic-2.00.a
> +      - xlnx,axi-iic-2.1
>  
>    reg:
>      maxItems: 1
> @@ -36,6 +38,9 @@ required:
>    - interrupts
>    - clocks
>  
> +optional:
> +  - clock-frequency

Nope. Just test your bindings...

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +
>  unevaluatedProperties: false
>  
>  examples:

Best regards,
Krzysztof

