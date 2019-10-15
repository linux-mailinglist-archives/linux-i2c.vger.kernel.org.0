Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C961D7FA5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 21:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389346AbfJOTKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 15:10:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38186 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389308AbfJOTKu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Oct 2019 15:10:50 -0400
Received: by mail-oi1-f195.google.com with SMTP id m16so17827819oic.5;
        Tue, 15 Oct 2019 12:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rdx+RGcYZmE7xTrxPtMWVRt9GbBcLhSlDvK0sKaIe84=;
        b=ILM1o6EZhPGrC1F0i4wtMC9Z56utKZIOKZohQ0sJwV7CgdszqsUuey91jTUlSF8fit
         fhZOdok8mleNBEvkt/xsgaN8d0KdE6m20hgAd8BWNgNvj7ZYi6t/xX0bdFE36UEuRdxZ
         MA0cwtRNh5oV4dfVX5+KjJ47/q9v9qIW8OjUonx8VhvtCASBfpe08pfKmbMiBCWlLaQl
         7G6Di15qT28HXWi01lOggSopWye9HTo+gaicPhlzT+UpiVqxSw0P48TYZIzOvcliqRus
         gZsd1hQMGFr+y9ICCVIUcjRQMZypYMwRYj8JGKaPA5JHyiWatEzIiMjDlOfudk7wrltm
         9aZg==
X-Gm-Message-State: APjAAAV332Mnjp4M6sR7jcHx8rBQWJvprwVwwovTpyEAydI4+HPt8YhG
        8jo1H7VEVSN5sx0Bs5sxjg==
X-Google-Smtp-Source: APXvYqx+m+Bb3C7kgH+eLbBDO+U5qtqn66b5kqCPYE/1rRFEDvRLKZS0IRkuc3gFAkT/j+pyxzRgCg==
X-Received: by 2002:a54:4f87:: with SMTP id g7mr108763oiy.100.1571166649597;
        Tue, 15 Oct 2019 12:10:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l47sm7091562ota.56.2019.10.15.12.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 12:10:49 -0700 (PDT)
Date:   Tue, 15 Oct 2019 14:10:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] i2c bus recovery for Microchip SoCs.
Message-ID: <20191015191048.GA32065@bogus>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 02, 2019 at 04:46:54PM +0200, Kamel Bouhara wrote:
> This patch series introduce the kernel i2c-gpio bus recovery mechanism
> for the Microchip SoCs. Updated the corresponding dts to add i2c
> gpio pinctrl. The bus recovery is configured for the sama5d3/4 xplained
> boards in dts.

Now we have 2 drivers with the same binding and code for using GPIO for 
bus recovery. Perhaps all this should be common.

Rob
