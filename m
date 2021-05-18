Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31CC386EFD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 May 2021 03:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236951AbhERBP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 21:15:57 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33348 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhERBP4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 May 2021 21:15:56 -0400
Received: by mail-oi1-f175.google.com with SMTP id b25so8304274oic.0;
        Mon, 17 May 2021 18:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zz5k7QuiOlU9bfYlucipJJA0H3dT8JlVnXPuvAayS0k=;
        b=R8ztLwkWBW9xECgO6sCrTKFVH9tTvtzKrCwulGtOvBxFF137MvGgNjGtlWcrJFA6mT
         wSl5h5Pp/WvlLQcENqDfR7/sKh3wcn2ik6tBLp3xxjSxyx4ERFgRd1TdLVRP22Hzz5FF
         7qT7ec0aM6sRu75Y3oRb4zBQty2wRGwZC5WU4lyzU7jlzWLvp3PHiJNPgekyONbPQusS
         Scut28Taoa/94uFgBxkfl67akzr3maJVsnBt/UT5pYlUqGG2s+pKQeQrLbeR12Y4nGLU
         YsyCmm46VmYTPAgK4slukM5H0ODLH54yMMnd7sAlzSSblcKNDEkXplVi4DiOBOsus2/R
         4p9A==
X-Gm-Message-State: AOAM531NP37R7Hn6XCAdRs+gWGnIuZ15fFIJFbUS9EazW7+6aHR3szpP
        WrxRzqGnZSNxj6KcpCIZ2VjYKOPOrA==
X-Google-Smtp-Source: ABdhPJy8u7/7GzHj8Uw6NccSxuP3x9GLcg3VlTTEswgt2WZATJe86UkqSNRIhAx3M3NR/KZuKNUCyg==
X-Received: by 2002:a05:6808:609:: with SMTP id y9mr1538822oih.174.1621300477842;
        Mon, 17 May 2021 18:14:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm3403085oog.25.2021.05.17.18.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:14:37 -0700 (PDT)
Received: (nullmailer pid 3578845 invoked by uid 1000);
        Tue, 18 May 2021 01:14:36 -0000
Date:   Mon, 17 May 2021 20:14:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        robert.foss@linaro.org, andrey.konovalov@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-cci: add sm8250 compatible
Message-ID: <20210518011436.GA3578788@robh.at.kernel.org>
References: <20210513175518.6023-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513175518.6023-1-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 13 May 2021 13:55:17 -0400, Jonathan Marek wrote:
> SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++--
>  drivers/i2c/busses/i2c-qcom-cci.c                      | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
