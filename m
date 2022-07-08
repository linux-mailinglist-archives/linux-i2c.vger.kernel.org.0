Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD6656C1F6
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 01:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238848AbiGHWP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 18:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiGHWP4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 18:15:56 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3845F76EA1;
        Fri,  8 Jul 2022 15:15:56 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id a20so19837ilk.9;
        Fri, 08 Jul 2022 15:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sNAXLwnHlgZL+RRPcwyuf08NpY2oRUI/xPRVTLc8Kv4=;
        b=LLvIxWbV4Ebtjp66YiQmkCQ5WnPAUM8WBSMItGOreaFVwEi1lh+SQR1EEV0NwLbNS/
         DnuPFG2IbBuZShAWesYWXCKJxHu01YYH/yG/7WqGR62dKQwPNI3zUDzDI7hBCeCP05bb
         cpTkBCYX35MzlNu+ZKwgQjrzSgSrJ8vTWbPN3UdoN6WamRHiHOVdiZpVXaq9IBmfUT5/
         FzXaiBZj9+Toi+uhxjJ20Rj9QICYLg7aEYUkTHvjjcg+OTIMxrlCItpHyLEaCH0f6OPZ
         CB+Gvhi8qkcaWWB/W7+ekphYHSV8xfqYd4o7Kf4ijZUWel0j2LWkBTNW9WFhKPJpsY7/
         A3gQ==
X-Gm-Message-State: AJIora+A2h8/og/0BsvzIzdgWhhjreWPdYe3HxFgU0wnIlrAIrewPfNk
        3+DRlzSdjKbLetJGKlShZg==
X-Google-Smtp-Source: AGRyM1sTh/9Jg+iKmfYd7WSDHoFeviiLxTHvbNq5LkBdkESc3E6BkRI9GjzwzexP1vAAvU154ityyQ==
X-Received: by 2002:a92:d705:0:b0:2dc:583:f588 with SMTP id m5-20020a92d705000000b002dc0583f588mr3459501iln.158.1657318555415;
        Fri, 08 Jul 2022 15:15:55 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
        by smtp.gmail.com with ESMTPSA id e39-20020a022127000000b0032e49fcc241sm18560635jaa.176.2022.07.08.15.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:15:55 -0700 (PDT)
Received: (nullmailer pid 1575582 invoked by uid 1000);
        Fri, 08 Jul 2022 22:15:54 -0000
Date:   Fri, 8 Jul 2022 16:15:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     mcoquelin.stm32@gmail.com,
        linux-stm32@st-md-mailman.stormreply.com,
        pierre-yves.mordret@foss.st.com, wsa@kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com,
        devicetree@vger.kernel.org, alexandre.torgue@foss.st.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: st,stm32-i2c: add entry for
 stm32mp13
Message-ID: <20220708221554.GA1575535-robh@kernel.org>
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
 <20220707074402.2429786-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707074402.2429786-2-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 07 Jul 2022 09:44:01 +0200, Alain Volmat wrote:
> Add the new compatible for the stm32mp13.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
