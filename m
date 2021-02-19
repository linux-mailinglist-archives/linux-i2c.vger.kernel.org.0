Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DA131FCF5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 17:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhBSQQm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 11:16:42 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:34483 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhBSQQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Feb 2021 11:16:35 -0500
Received: by mail-lj1-f169.google.com with SMTP id r23so22999084ljh.1;
        Fri, 19 Feb 2021 08:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ihu7RMD09CA5Sxv7Lq20UHk6yx8JzKzN1kPmi0JrkQ=;
        b=nEW9l4nPugf4QX8uk7cQG1uK7KK9jTGngP6MWX3p5WkC1x6YgFRJJS9Lr24ehVNQQj
         g7cvDrwOeHoMdVPEkvOR4/DDkOiKGaUob6M7y4xqQmCEFEs+xqIwwpjft+ScGfK3H1+I
         SqtteKpaoXz0qCU9sonMOk6UFDFTS5MsQEfupXuM2Zja4g+uMznRqbSpwRkid/PKKN+h
         d+enPziA2MP4QRgKx1UWTZQREx/4gjlg3AbDB/X81CWq+NbPdmr+7U4u4cjhnWpVi9R7
         vA101hRN0/cSzVtKONPY3LWhypQybBNwZI6TFf7tNvrzM1vp84qj4ZnTOKEK1dLS/pJ9
         k9+g==
X-Gm-Message-State: AOAM5336UUya48nb9pzS0u8T48voMHwodlYIFqFiLjb6rPjG8FNfB8X/
        ibZurruekWPSKUf97IZwMYU=
X-Google-Smtp-Source: ABdhPJxhNHtPHX8XCP+A4iney0+X7eNHNXGkFLPlnadqWxmrs9zTtSiTyQUTz9iybhncnae+5ihaEA==
X-Received: by 2002:a05:6512:945:: with SMTP id u5mr5747411lft.229.1613751352019;
        Fri, 19 Feb 2021 08:15:52 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id b11sm967616lfi.174.2021.02.19.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 08:15:51 -0800 (PST)
Date:   Fri, 19 Feb 2021 17:15:50 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Robert Richter <rric@kernel.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, helgaas@kernel.org,
        wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/kNnkusVHg8S0H@rocinante>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <YC/PoOOgRVHa1HIH@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YC/PoOOgRVHa1HIH@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robert,

[...]
> Obiously this is meant here:
> 
> 	if (!pci_is_managed(dev))
[...]

A question to improve my understanding for future reference.  Was the
previous approach of checking for "enabled" flag from struct pci_devres
was not a good choice here?

Krzysztof
