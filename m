Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F02C443D52
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 07:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhKCGkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 02:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCGkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 02:40:24 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCE7C061714
        for <linux-i2c@vger.kernel.org>; Tue,  2 Nov 2021 23:37:48 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t21so1813776plr.6
        for <linux-i2c@vger.kernel.org>; Tue, 02 Nov 2021 23:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KvV07TGoZaoGw8L0LWYKUbxKaPDqvzThxG6WFrFLoZE=;
        b=qV6o2DHzNyXcnTFQQPyEAH5HGAgqErf+nLausmvme7o+/HaH5BSY6GgQgYvm3NkDV1
         OR0M6iMn7ErGmFwBNJwqGcnzu3l2AYFln/0aOue4QU9nVvw9ay2ysnUE2cF7dZWoUOYH
         zLARG2g2WK8ganoyxRfEwndQ4J/4Irml4yeScRNO3KiamTkfwqbjH+IAAIoL15ZP5V26
         1v5s1K+xO1a1+PH3LDRkuvG2tCjW+/AJpoOYNzC9a4nhJRD9Sr7QgBzIa9O7SeyT2KwP
         3Ddois9E1aWdVaOecGfUI/sREvr3AoThqfVKlOv1mH9c7izxYcqWyPDhvnLUSt8A5x8+
         O9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KvV07TGoZaoGw8L0LWYKUbxKaPDqvzThxG6WFrFLoZE=;
        b=SixHAFjfi5OrC7huEpCLGQG9oAPx63kzIEuN2a5sSgT4VCWbpRhFijlkpmaXZRoA95
         KiftHjQeRfs6bVJz46XGlyysaQT/UtRSl8Iyh0x0jbw0WZFDBqVfLUxpxPDawbokZBDM
         3YezSmHGb1+9vVzO21wltxBC+oYLXk+61D0lMM9yoxpe8/UEvxDIBo0C/9y83Umjheed
         L+B3IDoZp1zZsuiQ7nR8XMhAKJqjjU9AyHIH73TYeB37zkhtq6cax2XHmOUzanrw3m59
         DEtAdkFC9DzwrNtj8aEqvLGvb5ruqi5MVPCX6bVNKm3Q7ghxYFoacTYzg081V6/MYe0k
         D7YQ==
X-Gm-Message-State: AOAM532wX/w9ShN34YZszis8e++ZY0tmOPNuYrDdtcFLYPjzjbc9bAON
        HrVR0X05s4C/4Kz10Y2fMhc+vQ==
X-Google-Smtp-Source: ABdhPJzCmOo15jlPdgZPi4SyQjZk/5+4lEfnC9j8LuN0Fw6C+DU4a7f23C24EyvWV1cMUmhMJaL6/A==
X-Received: by 2002:a17:90a:928a:: with SMTP id n10mr12308079pjo.128.1635921467640;
        Tue, 02 Nov 2021 23:37:47 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id oa4sm930068pjb.13.2021.11.02.23.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 23:37:47 -0700 (PDT)
Date:   Wed, 3 Nov 2021 12:07:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Chen, Conghui" <conghui.chen@intel.com>
Cc:     "Deng, Jie" <jie.deng@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211103063745.utpphthou4angs4s@vireshk-i7>
References: <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com>
 <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
 <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
 <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03-11-21, 06:18, Chen, Conghui wrote:
> >>> Over the long term, I think the backend should provide that timeout
> >>> value and guarantee that its processing time should not exceed that
> >>> value.
> >> If you mean that the spec should be changed to allow the virtio driver
> >> to be able to program a certain timeout for I2C transactions in the
> >> virtio device, yes, that does sound reasonable.
> >
> >
> >Due to changes in my work, I will pass my virtio-i2c maintenance to Conghui.
> >
> >She may work on this in the future.
> >
> 
> I'll try to update the spec first.

I don't think the spec should be changed for timeout. Timeout-interval
here isn't the property of just the host firmware/kernel, but the
entire setup plays a role here.

Host have its own timeframe to take care of things (I think HZ should
really be enough for that, since kernel can manage it for busses
normally with just that). Then comes the virtualization, context
switches, guest OS, backend, etc, which add to this delay. All this is
not part of the virtio protocol and so shouldn't be made part of it.

-- 
viresh
