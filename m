Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8831F1E0D79
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 13:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390196AbgEYLk7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 07:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbgEYLk7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 May 2020 07:40:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4FEC061A0E
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:40:57 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a2so20130192ejb.10
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3R2hnooSzZvAs9d5orE428NFg7oFKj14M/PhRYnHm+g=;
        b=MC3AAGzOyJf040Y5J3twKH/Sv4rtqfMp/QAbQ28YTdMp5ienj9Xx89GxVsmpo6R4RU
         xbqTu9jyRrn6eMpB4gjnN/EfiCIlmIc6IkI08/8jNsEc2e4uVHoBrSrarbtgwGPC0mEC
         nmU+6OtECbU8BiKJfqjwDFRcHy7VuOPsoRBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3R2hnooSzZvAs9d5orE428NFg7oFKj14M/PhRYnHm+g=;
        b=F+t4wuNxxKArQawGx7djZESSinSm6yCHUKaoCrys7n7IunR64oJAw3VyRuKjGA0tlq
         QAedl0NS2NnJUeCigXgG6TbybaSe/t62FuaiflVDI+OkuCrE+4rsAaMYApbMzrzpbAS8
         6MU/eJs0ywbQ1F7Kb70aY72w34FBi8Azqu3hzya+bKx7OEItX25NlNeJKfwIgRfHuRqG
         X9jiKfqjhPt/DX4BOxTq0xwAO1K2b8uGZzx26YwhTCYKAtV+f8ArUNR60FL8pkNhnfXC
         H7/4oh6rakM5ipoWlJktixkuJzYB3/P2CqbVFRgKqliYpFc5XSvIJLf1fRIjN11Mi1XH
         rJDw==
X-Gm-Message-State: AOAM532GcnV3Q5jOeOYJvZjgqLzZTLM9MwXkBvJzxqMLtuDKSfnUHJqP
        nLVBvqJ0QDMBVO/SU6L7MGWDML8617NISA==
X-Google-Smtp-Source: ABdhPJzgG0z0u1Od0SyBT/+ek76TIBnJm+iM18iH7Qo8xBHV7alnhCyqWHdy3cFsF+hWWfVH64tDZg==
X-Received: by 2002:a17:906:7a4f:: with SMTP id i15mr18910219ejo.71.1590406856285;
        Mon, 25 May 2020 04:40:56 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id w12sm15384097eds.4.2020.05.25.04.40.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:40:55 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id e1so16798933wrt.5
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:40:55 -0700 (PDT)
X-Received: by 2002:adf:92a5:: with SMTP id 34mr15165420wrn.415.1590406854796;
 Mon, 25 May 2020 04:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com> <20200519084833.GH1094@ninjato>
 <20200522150037.GF5670@ninjato>
In-Reply-To: <20200522150037.GF5670@ninjato>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:40:42 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
Message-ID: <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in adapter
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 5:00 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Tue, May 19, 2020 at 10:48:33AM +0200, Wolfram Sang wrote:
> > On Tue, May 19, 2020 at 03:27:29PM +0800, Bibby Hsieh wrote:
> > > Although in the most platforms, the bus power of i2c
> > > are alway on, some platforms disable the i2c bus power
> > > in order to meet low power request.
> > >
> > > We get and enable bulk regulator in i2c adapter device.
> > >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> >
> > Applied to for-next, thanks! I added Tomasz Rev-by: for you.
>
> Reverted because of regression reports in linux-next. I am all open for
> the change in general, but it looks to me that we should wait another
> cycle.
>

Thanks Wolfram and sorry for the trouble.

Bibby, I think we need a bit more thorough testing. We can discuss the
details offline.

Best regards,
Tomasz
