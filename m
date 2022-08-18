Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8874D598702
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 17:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344113AbiHRPMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 11:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344118AbiHRPL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 11:11:58 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E65BFA8B;
        Thu, 18 Aug 2022 08:11:53 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso1276800otb.6;
        Thu, 18 Aug 2022 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=WfG6z66abqmikTTPic3DpB5e3H4wBaNLiClJ/rnvyVc=;
        b=pucIdsytBnSNMGKOlVgFv3STr5Snk0UhtGcRmUKRjc4bdrWWDQYhYVXjamSzRZHy6p
         hPF1R5isHYgas+hSi2WZl4QgedPu6Kp48hmz7IWIQunNfS8XRX0jIY3t3Vfr/BISj/4D
         npF2cw4mBemgkzafMr46F/RWnNvw6Au4Rhu06XdB//41cwfliJf3IsUNP8wJrcm/oIxh
         BEKFrqvhlnUifiZX5zWWM+QOCKhcccWunvY5HADyYp8f3/123vdVYnxXgF/o4Zpy77/W
         vPkNtfL87m1QzHboXV89XKdbP3ZBbThaxJpnA0J7OmXJ2OwOecoojVRsTzQ4sSZW2EII
         Fh4g==
X-Gm-Message-State: ACgBeo3WjPRZ1gVa9FVCzsFga6v1TJc8UPHSZ+dafCHl1n80UyR/y1aQ
        Y2qupVrEIpXtPrjRzXYfywk2oACb3g==
X-Google-Smtp-Source: AA6agR6o7rSkFIPBKN9it7S6e36TvpRIoeN+/X1zhFrbsie8UcZ/YzC4dQpBxe2obE3oQFSaW2ODvA==
X-Received: by 2002:a9d:12a2:0:b0:638:937a:f620 with SMTP id g31-20020a9d12a2000000b00638937af620mr1239118otg.29.1660835512452;
        Thu, 18 Aug 2022 08:11:52 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fe0:b4f5:6e22:4704:df60:73a3])
        by smtp.gmail.com with ESMTPSA id v43-20020a056870b52b00b00116d5103487sm493752oap.31.2022.08.18.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:11:52 -0700 (PDT)
Received: (nullmailer pid 1877668 invoked by uid 1000);
        Thu, 18 Aug 2022 15:11:50 -0000
Date:   Thu, 18 Aug 2022 09:11:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 6/7] i2c-mlxbf.c: support BlueField-3 SoC
Message-ID: <20220818151150.GK1829017-robh@kernel.org>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-7-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816225412.9095-7-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 16, 2022 at 06:54:11PM -0400, Asmaa Mnebhi wrote:
> BlueField-3 SoC has the same I2C IP logic as previous
> BlueField-1 and 2 SoCs but it has different registers' addresses.
> This is an effort to keep this driver generic accross all
> BlueField generations.
> This patch breaks down the "smbus" resource into 3 separate
> resources to enable us to use common registers' offsets for all
> BlueField SoCs:
> struct mlxbf_i2c_resource *timer;
> struct mlxbf_i2c_resource *mst;
> struct mlxbf_i2c_resource *slv;
> 
> Of course, all offsets had to be adjusted accordingly, and we took
> this chance to reorganize the macros depending on the register block
> they target.
> 
> There are only 2 registers' offsets that do not fit within this
> schema so their offsets are passed as SoC-specific parameters:
> smbus_master_rs_bytes_off
> smbus_master_fsm_off
> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  30 +-

Bindings go in a separate patch.

>  MAINTAINERS                                   |   1 +
>  drivers/i2c/busses/i2c-mlxbf.c                | 397 ++++++++++--------
>  3 files changed, 258 insertions(+), 170 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> index 93198d5d43a6..cb3a012914e0 100644
> --- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> @@ -8,6 +8,7 @@ title: Mellanox I2C SMBus on BlueField SoCs
>  
>  maintainers:
>    - Khalil Blaiech <kblaiech@nvidia.com>
> +  - Asmaa Mnebhi <asmaa@nvidia.com>
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> @@ -17,11 +18,15 @@ properties:
>      enum:
>        - mellanox,i2c-mlxbf1
>        - mellanox,i2c-mlxbf2
> +      - mellanox,i2c-mlxbf3
>  
>    reg:
> -    minItems: 3
> +    minItems: 5

You just broke platforms with 3 entries.

> +    maxItems: 6
>      items:
> -      - description: Smbus block registers
> +      - description: Smbus timer registers
> +      - description: Smbus master registers
> +      - description: Smbus slave registers

You can't add new registers at the beginning of the list for existing 
users.

Either add to the end or it has to be conditional (if/then schema).

>        - description: Cause master registers
>        - description: Cause slave registers
>        - description: Cause coalesce registers
> @@ -58,7 +63,9 @@ examples:
>    - |
>      i2c@2804000 {
>          compatible = "mellanox,i2c-mlxbf1";
> -        reg = <0x02804000 0x800>,
> +        reg = <0x02804000 0x40>,
> +              <0x02804200 0x200>,
> +              <0x02804400 0x200>,
>                <0x02801200 0x020>,
>                <0x02801260 0x020>;
>          interrupts = <57>;
> @@ -68,10 +75,25 @@ examples:
>    - |
>      i2c@2808800 {
>          compatible = "mellanox,i2c-mlxbf2";
> -        reg = <0x02808800 0x600>,
> +        reg = <0x02808800 0x40>,
> +              <0x02808a00 0x200>,
> +              <0x02808c00 0x200>,
>                <0x02808e00 0x020>,
>                <0x02808e20 0x020>,
>                <0x02808e40 0x010>;
>          interrupts = <57>;
>          clock-frequency = <400000>;
>      };
> +
> +  - |
> +    i2c@2808800 {
> +        compatible = "mellanox,i2c-mlxbf3";
> +        reg = <0x13404480 0x40>,
> +              <0x13404200 0x200>,
> +              <0x13404000 0x200>,
> +              <0x13404400 0x020>,
> +              <0x13404420 0x020>,
> +              <0x13404440 0x010>;
> +        interrupts = <35>;
> +        clock-frequency = <400000>;
> +    };
