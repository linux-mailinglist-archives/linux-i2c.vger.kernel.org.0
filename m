Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A981422B874
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 23:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGWVSH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 17:18:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45619 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgGWVSG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 17:18:06 -0400
Received: by mail-io1-f66.google.com with SMTP id e64so7763579iof.12;
        Thu, 23 Jul 2020 14:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hx09CFzFEK3rFI8A30xOHAnNXgPfvKjfqFgA/SCg1s4=;
        b=cDGBlyJ/oPvBAF8l8jpS/xTS17YlXIVKkyxn9brRELeDmHQU9s4daExQDwKpdMNAp9
         hQVapPICgbvHru/ZC2F1OUUkcYFXJsS3AcJL7AO1eOf6Uqu+5S47iVl4e4q02was3BcA
         1fMf5f7sF00n2ca10/LOH6z7H4JlwAQ/frfFDsvvuw2KdFE7AzHPKdYNoEwwT/85Zhn8
         kWR4vbtmum/pObKnAI0AEFN5NvQ7/YURGWuTuk6opqq2Q6Tt1uy/Iua0h7lGRd6OLrO9
         tceT1I2Wh8sEyLMucu+dl/Avm2FcLm6n1qvqrB7p1EKVcjGvRKp4X+jnmf1cSrvXaLH6
         ENgA==
X-Gm-Message-State: AOAM531dzTTXBH4WdkCCjTw5rtkN2Z2H5ocI5ErKE2tIaALmcr7h0agX
        MQNtqL6hOYZHmtAvkPjwow==
X-Google-Smtp-Source: ABdhPJzIrbGkisYa8iZy5IAqxlxr48Sy8HcbDiPVQc/+SP8E4CfSPaTNyFUPOeLZfDlyP9BAFCp0HQ==
X-Received: by 2002:a5e:d90a:: with SMTP id n10mr7039546iop.50.1595539086180;
        Thu, 23 Jul 2020 14:18:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d9sm2016925iod.55.2020.07.23.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 14:18:05 -0700 (PDT)
Received: (nullmailer pid 875357 invoked by uid 1000);
        Thu, 23 Jul 2020 21:18:04 -0000
Date:   Thu, 23 Jul 2020 15:18:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     qiangming.xia@mediatek.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org, leilk.liu@mediatek.com,
        linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH 3/4] dt-bindings: i2c: update bindings for MT8192 SoC
Message-ID: <20200723211804.GA875327@bogus>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-4-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595421106-10017-4-git-send-email-qii.wang@mediatek.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 22 Jul 2020 20:31:45 +0800, Qii Wang wrote:
> Add a DT binding documentation for the MT8192 soc.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
