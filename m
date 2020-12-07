Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0F32D1DE9
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 00:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgLGW7O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 17:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLGW7O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Dec 2020 17:59:14 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FE4C061794;
        Mon,  7 Dec 2020 14:58:33 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id cm17so15606476edb.4;
        Mon, 07 Dec 2020 14:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vjvSckwg/9T20Pu309povgj0lbCxKiEZh3/BnNhvMto=;
        b=HMv5SecqHTLhTX8CT8YvNnZlegghRA4XYw9qH4HWjq/wbKQnPUeo/4iTV1IIDcRF73
         pw8X7Zjf28SXbQsosjX6wuqq/DQuK2Iw0C1dWnBAoXCQYD9OFTQeZGsAA1go6ti9hXrI
         3V+Q6GZy/igTS5PhgShUaKwdRIa3ut0O9+HZH6wJOTYYULr5M/zaBdyneSLPOqILUpMo
         aM3zkZUSFhakG5evwtsIvVTEwWVlEMum0JYkASXk8MLgjB4gJ1Y5vKu6TN/JNzHSjleT
         lb0RGW3YeDsBNqoq8BU0bSvWG9HwaDeiL3cljJEK3wbJgzAyJccq84QYR2W+eNX8iqOR
         l1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vjvSckwg/9T20Pu309povgj0lbCxKiEZh3/BnNhvMto=;
        b=WB5j9YFv09Z2b2HrNaA20jDFwGIc7Vq0X+8JitpBc9xggRwmSJzogiENfeL4Fw0ojy
         oZ2SxWCJLCJfl1MAo24UBpzr9oawLk/KqrknYjFfXD319b1aMz5HgIszJHW66fHOgGlu
         qvdmPXLyXbWlDe8pEjJ4v2Bds1fwnMuhNF6g+83XJevsJ3RacXkUd2R9cA3RZWQH36kl
         z7rvynGhyB09jN/V6NtHHNUcOfdxPcJF6buLaTWUYexyGNQCN8SDXPQkYNhfpTP2XbjA
         dDGhn+PYFjkGcUhEezzgJFBfeDcWWFwNV+OHmsSP91H3dEhRyfBJC4Lt2znHPscOwXFY
         RqHQ==
X-Gm-Message-State: AOAM532MXNgW0rNkDHx499BPh250IKgrSNPH/aX6QPBdf1Nmo/8QBKXN
        92G70o8Hh1rHQ3Ua+7Ad92z+ki6Pnz2gIw==
X-Google-Smtp-Source: ABdhPJyRAbX3qdmzUZR/AjIRVe2B7fRWi89/Cq9gL9ELWihRAgUFCMS5giS1IspcSQ61u8tyQLZsnQ==
X-Received: by 2002:aa7:da01:: with SMTP id r1mr22447029eds.45.1607381912632;
        Mon, 07 Dec 2020 14:58:32 -0800 (PST)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id v18sm12584636ejw.18.2020.12.07.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:58:32 -0800 (PST)
Date:   Tue, 8 Dec 2020 00:58:35 +0200
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/18] dt-bindings: i2c: owl: Convert Actions Semi Owl
 binding to a schema
Message-ID: <20201207225835.GD250758@ubuntu2004>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
 <20201207221214.GA929136@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207221214.GA929136@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 07, 2020 at 04:12:14PM -0600, Rob Herring wrote:
> On Fri, 20 Nov 2020 01:56:04 +0200, Cristian Ciocaltea wrote:
> > Convert the Actions Semi Owl I2C DT binding to a YAML schema for
> > enabling DT validation.
> > 
> > Additionally, add a new compatible string corresponding to the I2C
> > controller found in the S500 variant of the Actions Semi Owl SoCs
> > family.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/i2c-owl.txt       | 29 ---------
> >  .../devicetree/bindings/i2c/i2c-owl.yaml      | 62 +++++++++++++++++++
> >  2 files changed, 62 insertions(+), 29 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for reviewing,
Cristi
