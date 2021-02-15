Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F63631C3A8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 22:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhBOVeW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 16:34:22 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:33478 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhBOVeV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 16:34:21 -0500
Received: by mail-lf1-f53.google.com with SMTP id u4so5722492lfs.0;
        Mon, 15 Feb 2021 13:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=veZ4HBeiG6THyNIyPJqDZyhGQ9weLjZnQRwgVQIRYM8=;
        b=ln5EYC0hDh3N4Q2u+usEM1PHud+s4fPMzj80jhUQwdecA8+4GHjgL+NkG6TvTODBx8
         EfmH2ygM/CnEnW7gdwJ1bn5IefmEILAWT+ljTMLr+bx2+mWIHB5MDSsrvQ81C2FkVYH3
         yMaPMTel+Ljeljo56/n6njRt5eY4CkWMmCm/3iSYpBt/SxGekGX5wcwjmOe6FtT7Rj6Z
         dQPfu5RpC5pZ1T0P6mEccM8NHrc/koVhNUtYRRddXtex6fvf4YRNEVTn05mes/RexVBQ
         EdnJ5MJS6bi9id6FURLoFNziri/+inNKiaatU6/yxcWIUklQYDTVamPOjCsKqdTs0GbU
         1dIA==
X-Gm-Message-State: AOAM533gspW4bWM4RlDcVlhFNA/3vqnv7IBOnZJDokIMVGcS+wJbaLAT
        b8dEot+WftoWDsW5gKi/r/w=
X-Google-Smtp-Source: ABdhPJxRlPjw+MhIhIfdQZY9YYwh1lKvKxSPg7Rc/Gnh9qNYbqVn8ODOKSCEYzjusNzBweCgI9cPcg==
X-Received: by 2002:a05:6512:2014:: with SMTP id a20mr9572958lfb.437.1613424819199;
        Mon, 15 Feb 2021 13:33:39 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id d24sm2900031lfc.225.2021.02.15.13.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:33:38 -0800 (PST)
Date:   Mon, 15 Feb 2021 22:33:37 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <YCrosZvIneoaLnKv@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-4-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215181550.714101-4-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

See my comments regarding a very similar patch:

  https://lore.kernel.org/linux-pci/YCrnn+L42SR4N1PA@rocinante/

Krzysztof
