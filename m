Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CAB1CE8BC
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 01:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgEKXD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 19:03:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35726 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgEKXD5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 19:03:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id k110so9019993otc.2;
        Mon, 11 May 2020 16:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6abpqm2P83o/3f2rBgdXnNsVGvBaUGfzdzSfP0B8UIk=;
        b=bmze4aWSY5mzon93YbmuvPuLj9u4Yn7kB9BN48pIgIae683mZhLRPCVYqb9TA/zMpH
         Ffq9WUYbzNHOOc9R7gnc+vneUfEbsqU2OWU6s83jTwx99jeItB6itfYquEjQcZ0+w/ow
         ZcHS1LIk0OuYa7Bgh11EZ+7nERhcSut+4a1LE5yWHKfp0GKTRlLA2Sckbft6CZ5nMW4T
         s6xk0rwf5xkERTHssDZmzC2e5dzHfMcuqJCR3ydch4e/F0ATBb3qavYVDpJFZtA7JFw7
         pNlHRHNin+rDo+xwOjT1f4znsKwzbVPd2ux0mO4X6shvi0AC0Fb23C4JdPVD0ZbQJtxt
         d6Fg==
X-Gm-Message-State: AGi0PuZhHu0lkf4TuUmN0geniCXeF0ZaNs52BM9e26yFHzQlRAVcwIT6
        xOXi6YFU/Ev4wp2DeeaIUg==
X-Google-Smtp-Source: APiQypINK2hUBK6KwHLih5ZKpKToDjfgG8X1oTxLFmefw0CgowPlGu76ORlvr9A9Om6WR7IoSO5zNg==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr14711341otj.67.1589238236334;
        Mon, 11 May 2020 16:03:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e10sm5007114oie.18.2020.05.11.16.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:03:55 -0700 (PDT)
Received: (nullmailer pid 18679 invoked by uid 1000);
        Mon, 11 May 2020 23:03:54 -0000
Date:   Mon, 11 May 2020 18:03:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] dt-bindings: serial: Convert ingenic,uart.txt to YAML
Message-ID: <20200511230354.GA18582@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-7-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 20:58:55 +0200, Paul Cercueil wrote:
> Convert the ingenic,uart.txt to a new ingenic,uart.yaml file.
> 
> A few things were changed in the process:
> - the dmas and dma-names properties are now required.
> - the ingenic,jz4770-uart and ingenic,jz4775-uart compatible strings now
>   require the ingenic,jz4760-uart string to be used as fallback, since
>   the hardware is compatible.
> - the ingenic,jz4725b-uart compatible string was added, with a fallback
>   to ingenic,jz4740-uart.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/serial/ingenic,uart.txt          | 28 ------
>  .../bindings/serial/ingenic,uart.yaml         | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> 

Applied, thanks!
