Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C6F3BB72E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhGEGcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhGEGcq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 02:32:46 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8583C061574
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 23:30:08 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id o4so6640577plg.1
        for <linux-i2c@vger.kernel.org>; Sun, 04 Jul 2021 23:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kCy8PdVHeBTIQi07/Sw1LRfb7Q/EXacATKTbYu+2Fck=;
        b=QVj/ekGNd3LBhRATDInKpV5990ELYYESSnDGSuO7s+S/DGN6i/2CHSGVagsK/5dtEB
         OnUSmlD8FN9S25MJ3QAtWFtjXNCNA105DEEPRQYLlOj96d1x7IIV7eJ2zHttF0nDN+7+
         pspEb/iyZSFI+0Z/hM6lSrMpxYx1wm+730lobEUZHlNvd2ZVg+61Ybr0LgSiSyk95mtM
         hroAfuUkvIXQnI73a62/3/wSCn71CKnpD9qzbE29qEAA/4YvVla7c+/hXxk1lTOnkDgp
         3+C9JXZhJGH5MGkoEAN3uJ8Ui0GAGJ272cr80ZlHuQ9wdeM3KAExsYCl6NZg05cpY1vG
         0oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kCy8PdVHeBTIQi07/Sw1LRfb7Q/EXacATKTbYu+2Fck=;
        b=Ing3mRViy42N48bDPpnHdVgl6Fm87jHG21bRelFppEYWd/uoHwkMsc0ZW11AR2Huee
         Hd270PJTrH1F/94Rx9OPaGQ7eyxy8cCY3bm4nn/sInEjB6DCIy4K9NyAg+jr2rTYONsQ
         J7BT/oy0Po9tqvGitLaD53qAmCHfEUfmVXkoN7hTrq4UoVrqQp205UWQFdyLOl//7YFJ
         EwcGVkw4CzFvMkYH48ULTTxmcRzM/DAyiFVJMIBrKzdOruhasdngye7luwFRj21nQnIH
         k0K89EcXYKlRr7OTGSk9rfaY6E14qj4esJSiiCZo3YeV3lmghOLTqKouk15LEP22KIc8
         0BJA==
X-Gm-Message-State: AOAM533g7KrHCEECw86cvQdowjbGlB+DHtnIDDWHGX4MehEqTBIFJ6Ez
        APWdg9SAMMxB6h5H63v+HOC0PQ==
X-Google-Smtp-Source: ABdhPJzBIjW9yRmqeZARi3S9SO1AVvqH+PAwMV2PmCiAtk/oYko+ycXfzgAZ06qspQnraYwJUsbgZw==
X-Received: by 2002:a17:90b:4b87:: with SMTP id lr7mr13983622pjb.214.1625466606283;
        Sun, 04 Jul 2021 23:30:06 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id v21sm19445795pju.47.2021.07.04.23.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 23:30:05 -0700 (PDT)
Date:   Mon, 5 Jul 2021 12:00:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705063003.a45ic3wn74nre6xe@vireshk-i7>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
 <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
 <20210705043841.zujwo672nfdndpg2@vireshk-i7>
 <6aabc877-673a-e2bc-da2d-ec6741b4159b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aabc877-673a-e2bc-da2d-ec6741b4159b@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-21, 14:22, Jie Deng wrote:
> On 2021/7/5 12:38, Viresh Kumar wrote:
> > On 05-07-21, 11:45, Jie Deng wrote:
> > > On 2021/7/5 10:40, Viresh Kumar wrote:
> > > > On 02-07-21, 16:46, Jie Deng wrote:
> > > > The right way of doing this is is making this function return - Error on failure
> > > > and 0 on success. There is no point returning number of successful additions
> > > > here.
> > > 
> > > We need the number for virtio_i2c_complete_reqs to do cleanup. We don't have
> > > to
> > > 
> > > do cleanup "num" times every time. Just do it as needed.
> > If you do full cleanup here, then you won't required that at the caller site.
> > 
> > > > Moreover, on failures this needs to clean up (free the dmabufs) itself, just
> > > > like you did i2c_put_dma_safe_msg_buf() at the end. The caller shouldn't be
> > > > required to handle the error cases by freeing up resources.
> > > 
> > > This function will return the number of requests being successfully prepared
> > > and make sure
> > > 
> > > resources of the failed request being freed. And virtio_i2c_complete_reqs
> > > will free the
> > > 
> > > resources of those successful request.
> > It just looks cleaner to give such responsibility to each and every function,
> > i.e. if they fail, they should clean stuff up instead of the caller. That's the
> > normal philosophy you will find across kernel in most of the cases.
> > > > > +		/*
> > > > > +		 * Condition (req && req == &reqs[i]) should always meet since
> > > > > +		 * we have total nr requests in the vq.
> > > > > +		 */
> > > > > +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> > > > > +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > > > What about writing this as:
> > > > 
> > > > 		if (!failed && (WARN_ON(req != &reqs[i]) ||
> > > > 		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > > > 
> > > > We don't need to check req here since if req is NULL, we will not do req->in_hdr
> > > > at all.
> > > 
> > > It's right here just because the &reqs[i] will never be NULL in our case.
> > > But if you see
> > > 
> > > "virtio_i2c_complete_reqs" as an independent function, you need to check the
> > > 
> > > req. From the perspective of the callee, you can't ask the caller always
> > > give you
> > > 
> > > the non-NULL parameters.
> > We need to keep this driver optimized in its current form. If you see your own
> > argument here, then why don't you test vq or msgs for a valid pointer ? And even
> > reqs.
> > 
> > If we know for certain that this will never happen, then it should be optimized.
> > But if you see a case where reqs[i] can be NULL here, then it would be fine.
> > ot the driver. And we don't need to take care of that.
> 
> 
> This is still not enough to convince me.  So I won't change them for now
> until I see it
> 
> is the consensus of the majority.

Do you see reqs[i] to ever be NULL here ? If not, then if (req) is like if
(true).

Why would you want to have something like that ?

-- 
viresh
