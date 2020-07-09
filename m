Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01A121AB7E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jul 2020 01:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgGIXYN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 19:24:13 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34166 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXYN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jul 2020 19:24:13 -0400
Received: by mail-il1-f196.google.com with SMTP id t4so3543761iln.1;
        Thu, 09 Jul 2020 16:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C6gSA0EI8NAhedbaWCpzy+MxtCmLEWdTx98rM6v2aJ4=;
        b=OEw4z0ZrvKIeE86PaNyqbgvHrD2gdadNMMYvMKKJFXFJZNBAvJeYGhDum3diHVYbkt
         1TaeJedpGot0NUU6GJjlGSpa7iItiTsZ0QVYIZpba318wfdVLmuG2RvurrKhU0txQ5W9
         4Q3iUfnV4+wnq7MMVL2zBa0q5ruwyHQGkZB7KyXqX7Ov9SOdiDPRn+XNGMxYo5HeTXHV
         v5E+gvZW6xOz2QDBvv+x8jTeY2pa4kFxvVaCnjsZfjvmtJUixHhJfez1gKb+MwDcgESB
         VkLWe7RgIS5lGH1rIYyIgzVZfFxkPKmbJJ9oIqrbBuEOC+KhVyLvNRI/w1/pRi4lVDC9
         g81g==
X-Gm-Message-State: AOAM533+cB1nG+ymjNsxX0zYe4gg68RuhdlcmdIx1alA/1J2K34NFf+e
        wNtTQvarLFJPRF1XtQ7SEpnDqzpaQw+A
X-Google-Smtp-Source: ABdhPJwEi7a4BGxBFM0+WHbiO9IAQ/fGgukfTCWRV9BsdyHWsYFlnELlOQw3UQTchsNsqcLRiabjUA==
X-Received: by 2002:a92:8585:: with SMTP id f127mr48293818ilh.207.1594337052516;
        Thu, 09 Jul 2020 16:24:12 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id w15sm2743064ila.65.2020.07.09.16.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:24:11 -0700 (PDT)
Received: (nullmailer pid 1091574 invoked by uid 1000);
        Thu, 09 Jul 2020 23:24:09 -0000
Date:   Thu, 9 Jul 2020 17:24:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wolfram@the-dreams.de, linux@rempel-privat.de, shawnguo@kernel.org,
        festevam@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        s.hauer@pengutronix.de
Subject: Re: [PATCH V3 1/2] dt-bindings: i2c: Convert mxs i2c to json-schema
Message-ID: <20200709232409.GA1091519@bogus>
References: <1592279454-32551-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592279454-32551-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Jun 2020 11:50:53 +0800, Anson Huang wrote:
> Convert the MXS I2C binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- remove 'clock-frequency' property's typs and use enum for it, as it ONLY support 100KHz/400KHz.
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mxs.txt  | 25 -----------
>  Documentation/devicetree/bindings/i2c/i2c-mxs.yaml | 51 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
> 

Applied, thanks!
