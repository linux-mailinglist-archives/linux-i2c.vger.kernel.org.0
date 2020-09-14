Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D0D2698A3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 00:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgINWNM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 18:13:12 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45112 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINWNL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 18:13:11 -0400
Received: by mail-io1-f68.google.com with SMTP id y74so1814372iof.12;
        Mon, 14 Sep 2020 15:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYlsIRyu6onv8GGXU68dmCDB/GP6O0GQ68yS/zfWtiw=;
        b=Tye7183PF8m7WReRNyfdCrP9R2fA9R77GP8hOENIWZRN5fj+aIU3rSkTrENihWGzpK
         /pYysu13u56EcbtE5+2k6gRUV2cuuIYAHhaEHjnsZWF51XWuWVkDdT7C6TQVvwDO51Ht
         A0xyykyZ4KQXs36PiTxaguy99gNcBztwF3bjFgXtaKy1PkR/U6l1hXnDu2Yw1kfkIjfC
         phr0YM6TOSKx/E80aHD6IGnY5YWwUvradkEC+HyMC3eHKDEZxjFvSbDjoXrFbGzDf+jc
         8EK1oiVPY2ydVEZS/pZIIq0bL+mhM0UoUUxdHcybUjkL1VA6P/yEh7HKhVwMQAUi2But
         8zKw==
X-Gm-Message-State: AOAM532FLu4b71S7iNnsGvV/DWkiBG8nvKg90skzUZnIrHhnUdjem33+
        CYQvAa0gmxKeBCZykygDBA==
X-Google-Smtp-Source: ABdhPJzJS7APmTrdWR5VOV1+nzN1qm8abKy++8XWdAWk2PNGf0aEqcwADORcKsiBx5fQQBCUkJR4mQ==
X-Received: by 2002:a02:b70c:: with SMTP id g12mr14816237jam.62.1600121590320;
        Mon, 14 Sep 2020 15:13:10 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o4sm3753228ilg.56.2020.09.14.15.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:13:09 -0700 (PDT)
Received: (nullmailer pid 354360 invoked by uid 1000);
        Mon, 14 Sep 2020 22:13:07 -0000
Date:   Mon, 14 Sep 2020 16:13:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        od@zcrc.me
Subject: Re: [PATCH 1/3] dt-bindings: i2c: ingenic: Add compatible string for
 the JZ4770
Message-ID: <20200914221307.GA354306@bogus>
References: <20200904131152.17390-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904131152.17390-1-paul@crapouillou.net>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 04 Sep 2020 15:11:50 +0200, Paul Cercueil wrote:
> The I2C controller in the JZ4770 SoC seems to work the exact same as in
> the JZ4780 SoC.
> 
> We could use "ingenic,jz4780-i2c" as a fallback string in the Device
> Tree, but that would be awkward, since the JZ4780 is newer. Instead,
> add a "ingenic,jz4770-i2c" string and use it as fallback for the
> "ingenic,jz4780-i2c" string.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/i2c/ingenic,i2c.yaml         | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
