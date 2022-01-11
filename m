Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C3748B467
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 18:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344648AbiAKRuS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 12:50:18 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:39437 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344381AbiAKRuP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 12:50:15 -0500
Received: by mail-ot1-f41.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso9946683otr.6;
        Tue, 11 Jan 2022 09:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rE/zQ1NHhEOnOFHEQajAuZqfJDdiQ8VVuq+PXaVdSGg=;
        b=NE+cV2TjpqPVXdEcW7jeSORiVB5G5cT95tZS6q94pua7LIsuTLWnE1C6zn5oieFzGb
         RyELKu7Alp+JMHupM43lj0yd9Kx/AuCSOKzC3vwfpAOoQ7Ih+GktlQ2HyXBFETW8OYLE
         4mz/6E82/eUfmNnF7DpZHmSbAVgV2rtXWTSwmf/Cqk4xjVip8eoYhBuXYNvZUUV5afmC
         6a0G7L4CCWV/NJWHeg/XDbZfIxUbcobndavG5CcXFuljllzxSVvgohK3IwgU5RvWL0pV
         fpHXwfKqx1bcBIBGhcjh7QKyX86SQoX0RyrnTN1wg0c7TacbC+QREHYJTzLXABh2M2ib
         N5HQ==
X-Gm-Message-State: AOAM5335q/dHwVXZ+mEybOrqcTSYN6LSl8VnO0zM43sqwvdnxBtbuRf0
        0SCf25sDxVgQHpTQCUPfMA==
X-Google-Smtp-Source: ABdhPJzcKMShKBbkTfTV50XRAiHDvNhKAQt9t0uCo9VATcmdd+1oGIOfOnNPyU57ahwW+CLxUCMX+Q==
X-Received: by 2002:a05:6830:1be8:: with SMTP id k8mr4170255otb.226.1641923414614;
        Tue, 11 Jan 2022 09:50:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d3sm1763832oic.23.2022.01.11.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:50:14 -0800 (PST)
Received: (nullmailer pid 3226040 invoked by uid 1000);
        Tue, 11 Jan 2022 17:50:13 -0000
Date:   Tue, 11 Jan 2022 11:50:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: st,stm32-i2c: Make each example a
 separate entry
Message-ID: <Yd3DVdvmWBT9L6l0@robh.at.kernel.org>
References: <20220106183037.1443931-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106183037.1443931-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 06 Jan 2022 12:30:36 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
