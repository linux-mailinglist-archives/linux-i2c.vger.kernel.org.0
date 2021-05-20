Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA9B389A4A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 02:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhETADR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 20:03:17 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:33296 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETADR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 20:03:17 -0400
Received: by mail-oi1-f177.google.com with SMTP id b25so14829222oic.0;
        Wed, 19 May 2021 17:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CqZdJVwT0Nb8DrWS8WJIIqJzdky4y/DuKpCLQt6Q/iQ=;
        b=sZymdCNiahf8wEgqAaXW9Zz4XCniADcupJNxKRKM5GWN6Lcv62bfuPVQbR7tE84IMj
         xNj9LGS7vjiHHbyHCpegELypmakd3EDyIyWymFWOOjKLRoz6/Z31o/aZ+9ARPYUt0RtY
         JRfshjEFrOyhxF87oJ0gXy9IHQoCBxOZBJTESxVUD9kDnnpgrqV1YzT2K4H5ABxAUp8g
         BL85qCy2Av4HFssUYBIU0jLerEN8rnt2YcRkUXFgXkWkb5kGAvVg+yDtsgD0sCjGc8wL
         4710T7xDNcKK1Sf7vHwT7A0JarlsDjbUVLK53s5zJaFj3KBaYFIZtFxLhvUJ8FFeQm4D
         1eTQ==
X-Gm-Message-State: AOAM530VQQPCBf2NEMRkyXkCBWBeRYjtaEXOCp2bIV58NU3uAsMzL9HX
        0Hg2DhMPmJl52Tae4pqMIg==
X-Google-Smtp-Source: ABdhPJxThq8+RF1gT6s0i1ZuMM1z5xHsoubad0bkXqOJWVYPATEp0Bhsz4Xx38ghfJr5JR0XXyJewA==
X-Received: by 2002:a54:4385:: with SMTP id u5mr1322615oiv.30.1621468915739;
        Wed, 19 May 2021 17:01:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z6sm261788oiz.39.2021.05.19.17.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:01:55 -0700 (PDT)
Received: (nullmailer pid 3920838 invoked by uid 1000);
        Thu, 20 May 2021 00:01:54 -0000
Date:   Wed, 19 May 2021 19:01:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     linux-i2c@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mkorpershoek@baylibre.com, linux-kernel@vger.kernel.org,
        Qii Wang <qii.wang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Message-ID: <20210520000154.GA3920797@robh.at.kernel.org>
References: <20210518145522.2420135-1-fparent@baylibre.com>
 <20210518145522.2420135-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518145522.2420135-2-fparent@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 May 2021 16:55:21 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
