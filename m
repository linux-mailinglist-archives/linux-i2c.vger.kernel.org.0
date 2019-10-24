Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B4E3FB7
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 00:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732840AbfJXWxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 18:53:04 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40605 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732652AbfJXWxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 18:53:04 -0400
Received: by mail-oi1-f196.google.com with SMTP id b25so87094oib.7;
        Thu, 24 Oct 2019 15:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PHAlgjyftB77apGb+aIDH/iUEr5YTnjZAyjURTt+1ek=;
        b=Tms2Cy2WtxcWsa1MSb2MP35EKpoYwCsSzUWqm2g4AE2MbHMjGoFG35jdGeRZu/6lvS
         jPIeTgNu4HOo5AmbGNiV51SjAWgN1uB7dXrVPiiLiUkTM67QQATxU0J+Jt9YwxSbpbZz
         p47iQ3p6t7RvVYXmEu7qqOZEcfa9USI22Kh7eTKKW5zwBDUKwzv0m8NlfTxEuJyhlnDM
         ioYChsLOG2VJmqXLMahJWjHvYGP5Ni9yt0knSl+azmJ26RArBLkjh4Xz5sSHz6hm/d4Y
         SEl/Rvr2H+dwuMwegC+OKaUNER3ZdQJdr0Vre2Ey+4T+R9/lVNewmUbEAVwvnk4Ea8aC
         JBmA==
X-Gm-Message-State: APjAAAW3aT4yHzDRcTcywOnO2JDedq7cLPFrAZ7IZ4jBNoHaax0DXYOa
        2nL5v8Os7516rLwqpg1w4Q==
X-Google-Smtp-Source: APXvYqxLLOybpoUQdqUi4zwyI739/mCOO6k17Sx+gGPlyn2e7YB8PCSksprbWMBJjSIZSr3Fq4+K0g==
X-Received: by 2002:aca:100e:: with SMTP id 14mr411171oiq.20.1571957583265;
        Thu, 24 Oct 2019 15:53:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm35386oiy.45.2019.10.24.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:53:02 -0700 (PDT)
Date:   Thu, 24 Oct 2019 17:53:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [v5,1/3] dt-bindings: i2c: support property idle-state
Message-ID: <20191024225302.GA16606@bogus>
References: <20191022041152.3663-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022041152.3663-1-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 22 Oct 2019 12:11:50 +0800, Biwen Li wrote:
> This supports property idle-state
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- none
> 
> Change in v4:
> 	- none
> 
> Change in v3:
> 	- update subject and description
> 	- add some information for property idle-state
> 
> Change in v2:
> 	- update subject and description
> 	- add property idle-state
> 
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
