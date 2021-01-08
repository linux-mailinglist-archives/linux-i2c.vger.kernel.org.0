Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24A62EEB67
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 03:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbhAHCjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 21:39:43 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:44660 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbhAHCjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jan 2021 21:39:43 -0500
Received: by mail-il1-f172.google.com with SMTP id r17so8829201ilo.11;
        Thu, 07 Jan 2021 18:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8GV7kMjVrzdzl87Yp62XRULxL0aUQ0RzDrKB1F6GtTc=;
        b=DM6zpf32EHvbftWbwjXKr6gLPOekJRxIuSUcJO7yohNXH43AD+25yDM/y5B9NCfDf1
         TO1Z0ZPw1SbOgf/VBj9ySaznOZOmwG4/uPRGSndb6MoiHzm6sX4pDaoyaQ0trens5Bf+
         sDDnxHmcyg1cZCEPp7ZLdfvgI//Y1imLbS42hbqpT1ujR52h6XsSO/2IzqAlZPATxgSZ
         ym95OHRLUF7bfGKmdNpFR6Q1gIYFG/i9So8Us/OdYAXB14tcrwpDWNP73URVOwNR8BdQ
         H8VmhFJ9bQAFhqv+lFNy6zEuYSK/ms8ab+CZRLeM/QrdrZFjk792NOOloY01yBAqWhHf
         kcEQ==
X-Gm-Message-State: AOAM533KObMjUgimLKS0rD9+xZ7hsCkO/DOKfAH8ukf1fLM/PDFkVXBa
        WbhRR+tdLeeoI6BS3ejFUHSpdTnYvA==
X-Google-Smtp-Source: ABdhPJwQWIS0AqEtwf5siLLglypIzUBkyYWeaBuunvnFPwTT2obITgGjJC8UNNKIJ8I5mOYJ1Spc4A==
X-Received: by 2002:a92:b6c7:: with SMTP id m68mr1798412ill.95.1610073542206;
        Thu, 07 Jan 2021 18:39:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n11sm4142738ioh.37.2021.01.07.18.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 18:39:01 -0800 (PST)
Received: (nullmailer pid 1764740 invoked by uid 1000);
        Fri, 08 Jan 2021 02:38:59 -0000
Date:   Thu, 7 Jan 2021 19:38:59 -0700
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U)
 support
Message-ID: <20210108023859.GA1760971@robh.at.kernel.org>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
 <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 23 Dec 2020 18:25:00 +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
