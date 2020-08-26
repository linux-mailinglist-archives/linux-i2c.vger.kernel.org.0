Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9867325310C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 16:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgHZOSS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 10:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgHZOSO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 10:18:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B7CC061574;
        Wed, 26 Aug 2020 07:18:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k1so1065867pfu.2;
        Wed, 26 Aug 2020 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5HN8SVYTWAqpUbTUQ7xaIG63eRoyrfMEVmJbrdoVYzE=;
        b=DpllK69A/ERvmVIIUtSSByyHUZhTS+90OIW+1wi2+T4KR5gBf8MPVvbnMMmPwSLj5M
         U/JbRBkJkTFB9nKoCifcgAYNaTJxt3DGQLZWi4btOd70ckXx+qw9gINLKlJQq/j8LhKB
         wVUTIkDw7nXS2fPF1wUuruiyr4BRHmllxaFWdodQhJcc+7wyTGIqR4JY16BS4fSTVZAx
         JyerP0lxFshro1bcyy0Mx3Ti7Hlf3rITNEINPillYmMQtq+MFRPrODQB9nG3gxrhTdm+
         hMGNKUsL7OO12qajIbSUgg+dUycrlu979s218gQuVLmmI5S+5g5u3KYJbaNHIKzguWkN
         oAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5HN8SVYTWAqpUbTUQ7xaIG63eRoyrfMEVmJbrdoVYzE=;
        b=PCFflp4wbhn+ip7v9ykLEkVKFCEowELu4uZeKqZzXpVtHATi95W87jDnLzOIHi597P
         8YvIYgt0834nSa0JkoggrJC3mM6sSaMyM84Vq1F3wM9BgzeAFKqxvfZUAVOfwTDmBvbu
         FlONLMdiQ486ZCS0NyBv9DjbRiC/KzZCygoTqD8yYdo7rCmBOrKQr1BGFspjG9mTHVIy
         pmPg8vrY+BUbATHoUzafv8zICJx+tFqIFVexkYpehAPrMKw+Rpcu7Lw7UWkvPFUk/b3F
         +HkvOsVGutUFllje+vTc7MRemJA2jW+PC6PHJN3h6JpMwlFdKBazEuOQPqlK8SJ+JgqM
         BHnA==
X-Gm-Message-State: AOAM5326nh1F1MDeetdBt0B3hSFaTm3Xsiz01q5wcqIj3ZJnf/uMOUEh
        sbbidyPQjcx74vWXeqpd0k+RS0wCknY=
X-Google-Smtp-Source: ABdhPJy4gZ6UtglpMvsQYaZN8z0RATEExHk1bzX89Q9uPuVHw1X4hvO6ikQLQiGX9i7Fb8OkcoRSrQ==
X-Received: by 2002:a05:6a00:16c6:: with SMTP id l6mr8640665pfc.80.1598451493955;
        Wed, 26 Aug 2020 07:18:13 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id t2sm3304891pfb.123.2020.08.26.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 07:18:12 -0700 (PDT)
Date:   Wed, 26 Aug 2020 23:18:10 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826141810.GE8849@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
 <20200826102411.GC8849@jagdpanzerIV.localdomain>
 <20200826103807.GD8849@jagdpanzerIV.localdomain>
 <20200826105426.GJ1891694@smile.fi.intel.com>
 <20200826112326.GC1081@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826112326.GC1081@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 13:23), Wolfram Sang wrote:
> On Wed, Aug 26, 2020 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 26, 2020 at 07:38:07PM +0900, Sergey Senozhatsky wrote:
> > > On (20/08/26 19:24), Sergey Senozhatsky wrote:
> > > > > But then the question is why we have this code in the ->probe() at all?
> > > > > ->match() is run before probe by bus core, no?
> > > > 
> > > > That's a good question.
> > > 
> > > Everything seem to be working OK on my test board with this patch:
> > 
> > I'm okay with it, but I want to hear Wolfram about this.
> > If it gets a green light to go, feel free to add
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Sergey,
> 
> Can you send a proper patch (with patch description) and me and Jean
> Delvare <jdelvare@suse.de> in the To: field?
> 
> The origins of this matching code are pretty old and Jean is more
> experienced there than I am. Nonetheless, I will check it, too, of
> course.

Oh, sure, will do. Is that OK if I'll base my patch on linux-next?
I'm also going to test the patch on more devices here on my side.

	-ss
