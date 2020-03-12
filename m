Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9543218356F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 16:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgCLPvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 11:51:31 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41615 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbgCLPvb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 11:51:31 -0400
Received: by mail-oi1-f195.google.com with SMTP id i1so5915620oie.8;
        Thu, 12 Mar 2020 08:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RVkiFkRTeMMPin+ptF3A5+ftH+/EpqC/zb0+nmdjcHs=;
        b=toF8YxJmbBFbeBgAaEsBro0VNRGWpQX1/DPzm6r7z+hqd7wmTxMJShBjsSBHPek+sG
         2XuiuUdDoeOGQpFHvkJuSg6nMpvtFDAJ4BrH9HuPwRaFCJQTfBMDytBGWuRbvOz+h53I
         WwYuyYyCr+x7f9UZGNCqVa/eRJyvD8uaVzi8o3Tew3MQMa+3hHaE/WqVhIAnAo1QaoZf
         dusPwbxQvxEBqDQfK5IIHXQouL5QoCiI8t/aa54wMLSnHYrylFRXKEmHXodlWEtT5sA3
         hlhyuik5SO8uplALfQw8WzfRgBEMJiEy7p7OMCifX82oAm5URDY7oF2QWfykdhomZHYt
         LbNA==
X-Gm-Message-State: ANhLgQ18UWcuFbGAgnejfIZpUt7cRKeduPpdu8884qwK2GrIJ17GTVJE
        3988/NHQXtS4NiH2fUUijA==
X-Google-Smtp-Source: ADFU+vtk9BrXX5QE/hVGSJYCF4XdX2a674gSPQcVH6JhNyN1Jkv/+TdnylpBR4PjORujal77pChfLA==
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr3097374oiy.27.1584028290815;
        Thu, 12 Mar 2020 08:51:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 67sm6631494oid.30.2020.03.12.08.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:51:30 -0700 (PDT)
Received: (nullmailer pid 26600 invoked by uid 1000);
        Thu, 12 Mar 2020 15:51:29 -0000
Date:   Thu, 12 Mar 2020 10:51:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: i2c: i2c-rk3x: add description for
 rk3368
Message-ID: <20200312155129.GA26550@bogus>
References: <20200305143611.10733-1-jbx6244@gmail.com>
 <20200305143611.10733-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305143611.10733-3-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  5 Mar 2020 15:36:09 +0100, Johan Jonker wrote:
> The description below is already in use for rk3368.dtsi,
> but was somehow never added to a document, so add
> "rockchip,rk3368-i2c", "rockchip,rk3288-i2c"
> for i2c nodes on a rk3368 platform to i2c-rk3x.yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
