Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2877C73E15
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 22:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391655AbfGXUWM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 16:22:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40394 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390815AbfGXUWL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jul 2019 16:22:11 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so5804918iom.7;
        Wed, 24 Jul 2019 13:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/30AS3nqkWWu+3IMVyX4v9nQ/uVi14wrBVbKbNIwDH0=;
        b=ekj0LIeZj9w5dZ1iFJTQMocLGklgKFNFkBXzDwuhI4RB10PYuavh/i6uOI32d86B2C
         ypTECM/GBXT90NiCeRuCFHbWlUFgCV7VKamtmNBuIEv5+JsQhj1FzUS+O/EMwdCH6dcO
         P0NYZGuMMILra9O7AV4bXVRtv1zeSEC64XsLkYfbGSn6WO4cwl4Vgj7P/nSUHe5YMaKO
         9Io15AcVq5ImPVNFW+NzVsDzoYKzwNV8XmLBGFvWyteipR1T/PuH3YVywCZNc/09l7nv
         kel45+XZXMcJIKx9+AL9K/mP7Uwsp/SZ5vghfH9WbfznN3puV5oUmF6PjSY3kpV+iI5J
         pTqg==
X-Gm-Message-State: APjAAAUL+Ou5xExnGsGQUNWjTps4YOw0N88V0Km2aTOWtG1+nr7MEkLB
        hKhKCqwLnrC8dCiTARBtKg==
X-Google-Smtp-Source: APXvYqw8/yMFLvKjW7NMwY+ZvPnqeFIopuxH5djPlnJEGbRQVjM6/Fd6l3umrAZVnmBM4ywFQ0VJmA==
X-Received: by 2002:a02:b395:: with SMTP id p21mr88532316jan.31.1563999730430;
        Wed, 24 Jul 2019 13:22:10 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id x22sm33617648ioh.87.2019.07.24.13.22.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:22:09 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:22:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     wsa@the-dreams.de, peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, Eugen.Hristev@microchip.com
Subject: Re: [PATCH v3 1/9] dt-bindings: i2c: at91: add new compatible
Message-ID: <20190724202209.GA31102@bogus>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-2-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562678049-17581-2-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 9 Jul 2019 13:19:29 +0000, <Eugen.Hristev@microchip.com> wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add compatible for new Microchip SoC, sam9x60
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
