Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC0F125679
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 23:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfLRWSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 17:18:41 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43255 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRWSj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 17:18:39 -0500
Received: by mail-oi1-f195.google.com with SMTP id x14so2026621oic.10;
        Wed, 18 Dec 2019 14:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/4DCBGTzV25UqwiiGbHriQAr3E9Rn3IXXhGkvh3a7hY=;
        b=BREEZcCPj36BE8OL53AQ3mt3dRIZkN/CTNHC+FjFicSGOusz39qUsKLKrNHWZ98UHa
         sMAxcoMbWDN5vQApNbkN4OxhLhdFozrJ/y8LTFc072XePZHeCuB4Gxc9/0V0YzXF0ejA
         eH/UehlU8HR7v+8xcgV0qbdBnwLgTxDKGMlx9L3TewCBgKl4oDizA8xA/6SqywXSILMV
         I1AFUOPJlRhGIOFpc0Csso+sAh4AiWoTnls0toG5L2NQQDtOVtvAFQoT5YvWeW2wJHT9
         jpULjMV0CbZGHYLSx0fWIT9ljkVXI5BuUZFLzSNanTvbLcXfmrP4MjcLxTAgshlua4rA
         DV9w==
X-Gm-Message-State: APjAAAU39tVsW9QaB7k0Bb2WK5ElDAvu2focxUvBWDDqAzrkz7TWg9PM
        nVy3ZrwROwyH63yE0nX+5Q==
X-Google-Smtp-Source: APXvYqxn0yvz4TRVwtiUKNKpafKpf6Hjnbe2ieMd81LDvcEqkQUy8kwzMvieUr8SBs9uriNVboNWpw==
X-Received: by 2002:aca:f305:: with SMTP id r5mr1618542oih.174.1576707518439;
        Wed, 18 Dec 2019 14:18:38 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v25sm413787ote.61.2019.12.18.14.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:18:37 -0800 (PST)
Date:   Wed, 18 Dec 2019 16:18:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, 2374286503@qq.com
Subject: Re: [PATCH v3 1/2] dt-bindings: I2C: Add X1000 bindings.
Message-ID: <20191218221836.GA24317@bogus>
References: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576570450-122556-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1576570450-122556-3-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Dec 2019 16:14:09 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= wrote:
> Add the I2C bindings for the X1000 Soc from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
>     
>     v2->v3:
>     No change.
> 
>  Documentation/devicetree/bindings/i2c/i2c-jz4780.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
