Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095433DE030
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Aug 2021 21:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhHBTl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 15:41:27 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:40894 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhHBTl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Aug 2021 15:41:26 -0400
Received: by mail-il1-f173.google.com with SMTP id d10so17498863ils.7;
        Mon, 02 Aug 2021 12:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t22Mw5fsW12nTc3NS3Ax8f5t27g1cdS7MTqs7qAg1c4=;
        b=Z3BIHATXCzDKGLmEZXY9O3Boe2cYPogFcHmEU68pHfajZcYb+Bp09UZ3ER0+I/nnl0
         423jjNCLtSH8UMSlM71rEXdhvG6/FOnxNiXieDIGttBd+frCrAqw8yJ9gEofah8JVHcK
         4Jh5ETxQpfEo2Tf1XArlyPrrvjPlOgf11VWmAPvOD0YX2eSwP4fY8TYa/1C6mqlnP364
         XDtwmRU+UU7DvUrWj5NyA6yQkna0P9wa16TTmSD9kLratWqZrcCAOPfrnJTxAcFTckYR
         wsX/C1L6d4AR0YvwMNcQ+UT8z4KALPvrtWXwwyTDLg+xeXbrnvIzhy5t7m/M1N704ZNO
         cJIA==
X-Gm-Message-State: AOAM533UwIPC9ewxUwalEyIBkVVNozUBLQOlphrtyDpR01T4HCb6egAM
        30ITbWcINNv1yYz5FT8g2g==
X-Google-Smtp-Source: ABdhPJx6dao4W2VJ96dqV2lg5KOP4zvTBc3DlEOFZP3Xa1KIf1LuX/EUnSG2QPx1ZEyoHnPPXAb+hg==
X-Received: by 2002:a92:d451:: with SMTP id r17mr1650251ilm.109.1627933276312;
        Mon, 02 Aug 2021 12:41:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z11sm7545105ioh.14.2021.08.02.12.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:41:15 -0700 (PDT)
Received: (nullmailer pid 1476648 invoked by uid 1000);
        Mon, 02 Aug 2021 19:41:13 -0000
Date:   Mon, 2 Aug 2021 13:41:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bill Mills <bill.mills@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jie Deng <jie.deng@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux-foundation.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V4 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
Message-ID: <YQhKWWi1g+nqSAqX@robh.at.kernel.org>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
 <33c317b95097ce491845c697db1e8285e3ec1d41.1627362340.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33c317b95097ce491845c697db1e8285e3ec1d41.1627362340.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 27 Jul 2021 10:53:49 +0530, Viresh Kumar wrote:
> This patch adds binding for virtio I2C device, it is based on
> virtio-device bindings.
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
