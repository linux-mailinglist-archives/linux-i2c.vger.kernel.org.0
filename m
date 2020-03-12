Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999C818356D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 16:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgCLPvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 11:51:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43667 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgCLPvN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 11:51:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id a6so6724131otb.10;
        Thu, 12 Mar 2020 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ikJbvAhzJEgIWg4iBpBnF6s5EbtD/zP7fgvKc2Wxses=;
        b=D1x64L89NIhxbTFM4DDuUNxCVbknDMKYiO0iQdHdI+QhxmHWrUMQZvy4djPobnkUfc
         NRLvPt/sQB9K5iXUe3UVUaLqjTnJ0MhOfGupDE8MSh58XfgdV+M4FaA8L2TfHHW5pUoE
         ORk67k3Rn2xx7jsu6sLw4zAs2xtci3Zg3VZ5LIMQ5DAq//cUzeCBAYMYbKk0iMsmA/Ot
         1WQvzyWTI1q7soreo4tiY+823y/fgg/qLOcmiLIcSG/A6hr5inWrGL7fHTzLOJJ2HqZF
         8aQG0QcyHpm6tD2QrbsqRDbFyPErtGkBgi8xU8OWFXoLxVwKYy+G+s4wWgPGCLo1Up29
         VLtw==
X-Gm-Message-State: ANhLgQ2wSDrCmtK8E7hcUXQFMiEmYeOBHKPLHW1Al3m044pqALcjm/GR
        vymOLrIQ9sT4s/uRjiDgTQ==
X-Google-Smtp-Source: ADFU+vswRgTiSFs3jrGhperqQ9lLysFDkyD31XUqW8Fep83FSF5i8XG+iYIQ5XapLA2hxlCgHDWQzQ==
X-Received: by 2002:a9d:2208:: with SMTP id o8mr6706528ota.208.1584028271932;
        Thu, 12 Mar 2020 08:51:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 8sm6621696ois.15.2020.03.12.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:51:11 -0700 (PDT)
Received: (nullmailer pid 26057 invoked by uid 1000);
        Thu, 12 Mar 2020 15:51:10 -0000
Date:   Thu, 12 Mar 2020 10:51:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] dt-bindings: i2c: i2c-rk3x: add description for
 rk3036
Message-ID: <20200312155110.GA26004@bogus>
References: <20200305143611.10733-1-jbx6244@gmail.com>
 <20200305143611.10733-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305143611.10733-2-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  5 Mar 2020 15:36:08 +0100, Johan Jonker wrote:
> The description below is already in use for rk3036.dtsi,
> but was somehow never added to a document, so add
> "rockchip,rk3036-i2c", "rockchip,rk3288-i2c"
> for i2c nodes on a rk3036 platform to i2c-rk3x.yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
