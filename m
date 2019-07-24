Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3250973E2F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 22:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391029AbfGXUW6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 16:22:58 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33842 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391354AbfGXUW6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jul 2019 16:22:58 -0400
Received: by mail-io1-f65.google.com with SMTP id k8so92431374iot.1;
        Wed, 24 Jul 2019 13:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uDWllbWAHHQJMizorbNWUIyq7E6utwVtniA+GguMM1I=;
        b=cVjchWWIPFWeJj0wCibDHhpTCz1Gx11DShGuSE5VxPS3HbJFVJltsdvEjwsLa4/Q92
         vv319caU6V2UVTpKM9qyHiEqeOzbfZcBmN/G/4RNfbJabTBLVsjazpDrvnT6b2W+IB2S
         TH1/aHMZF9eKcnXbW/9LZmK31ztD8zyIlP/06JK19JL3D/HWRFPeEqgYU4Ggc2vbgIBM
         FdueCtFEQjkLLUMt/UzQS9lr6KC/KqQIbtUW9wELbEVY/KVgPEP/xRDcbmKzwfLtfqoH
         CvGjkQrQ+aioaooiJG7KSKLUryto2F9j1TradUYfRgM0NEW1sB8QkI1c2acFt9ey1u1l
         H3ig==
X-Gm-Message-State: APjAAAWrtE8ye0lyUTUNBJWYnrd1SKQpAZiMHMJdB2a6uY+w7QbU4pTA
        ipSU6Dhfhon+5h1UzTCuVw==
X-Google-Smtp-Source: APXvYqyQ9siwx0xN6aEL1lklrUj+Z5DeRx/7MB4ml1qvejrwmjU2V5SRYjuEr3YtGaU4tpxw1zPF8g==
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr39825656iof.276.1563999776985;
        Wed, 24 Jul 2019 13:22:56 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id l14sm42995882iob.1.2019.07.24.13.22.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:22:56 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:22:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     wsa@the-dreams.de, peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, Eugen.Hristev@microchip.com
Subject: Re: [PATCH v3 2/9] dt-bindings: i2c: add bindings for i2c analog and
  digital filter
Message-ID: <20190724202255.GA32633@bogus>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562678049-17581-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 9 Jul 2019 13:19:33 +0000, <Eugen.Hristev@microchip.com> wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Some i2c controllers have a built-in digital or analog filter.
> This is specifically required depending on the hardware PCB/board.
> Some controllers also allow specifying the maximum width of the
> spikes that can be filtered. The width length can be specified in nanoseconds.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
