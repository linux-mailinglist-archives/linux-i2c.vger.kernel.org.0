Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8ABF183B90
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 22:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCLVnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 17:43:42 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36656 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgCLVnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 17:43:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id j14so7990076otq.3;
        Thu, 12 Mar 2020 14:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FS6zflFtBZJ0h4IEljhEJ+diBwLFSLqaaufLslTBNpc=;
        b=YUto8nOYx1ZT2v6aEqhunHehCqagH7dAiTHoYGHfiULcMi5KcB+CSJVQeKoFBmcRkq
         6hO2OY8x79I/9QMhgsZDWslHvD4HvNilY4YrDe105O9vENGQI74tyOhW4GEyJ5KjVcpI
         sflAQsbVb+7HWH3eTCHBAdrR0odeVo91vt48IcJVJZ4ILfDRILA7Pc90atdBYjLbZy/h
         i5bpiKdxMGy6CKisib7dqV8CY+aH4QMenZFFeZJslvBQKCeLUFWF7TZiZrmKb6S6DyRO
         m+N3SrJY2YlgQ0aKdoRmI40+sTZiOp20Y2RxZV5CjXffJFnoDY3CRs4nfnF8yWfUZNAZ
         TG0w==
X-Gm-Message-State: ANhLgQ2/s7Bci37K0SF24lW9dgJm3G4txsIA0meK3x1kSH25hT4JRDKp
        ncB29WfB8qL1tZebMWkkSg==
X-Google-Smtp-Source: ADFU+vsw8ICdjL4f6vlMn6s5eYnygJbkzUnQLy5msXRE9bKJvxZl3+HHEAHH9r/ujWAInwFYD5s0hg==
X-Received: by 2002:a9d:837:: with SMTP id 52mr7862324oty.354.1584049421550;
        Thu, 12 Mar 2020 14:43:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t193sm7160303oif.34.2020.03.12.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 14:43:40 -0700 (PDT)
Received: (nullmailer pid 30418 invoked by uid 1000);
        Thu, 12 Mar 2020 21:43:40 -0000
Date:   Thu, 12 Mar 2020 16:43:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C
 controller
Message-ID: <20200312214340.GA30360@bogus>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132018.C268A8030792@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306132018.C268A8030792@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 6 Mar 2020 16:19:52 +0300, <Sergey.Semin@baikalelectronics.ru> wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Just add the "be,bt1-i2c" compatible string to the bindings. The rest of
> the DW APB I2C properties can be freely used to describe the Baikal-T1
> I2C controller dts-node.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
