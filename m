Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FF035DDA3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 13:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237455AbhDMLUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345309AbhDMLT5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 07:19:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B096C061756;
        Tue, 13 Apr 2021 04:19:36 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id n38so11236705pfv.2;
        Tue, 13 Apr 2021 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydnI2LeKjKk8DGRO2Vyu2Z6yegZyRC4+HvAXjSsEA0M=;
        b=VKnBJLKhPj7QWNWGJW6QP8m50kemxmTcxm1dZA2VSBTGgP6dWlqT2pWLm9Avqxl/Sj
         cw9+BrVkKqVYmYFPAvSehgziQEA65MYMg/yGk6WhgfrqpFkgNlMVrfNH9u7ApHNHs4QB
         qP+lkFIHNNICNwFtnu/1VFuRqrhwCJQYgySp8DRU9wFGBipCWC1oQpyuYh0TG1ZfjcPO
         QAqDvXgi9cT4jvr6EVaRPZj1igFywDJuho+iXU676ybJJ/DmlIh2xHCBa2eXF0Ea7xDV
         AhjqSpXScf2cExllx6E5f10yBxZsadpWaHZ03UU5HebhXMnboZQGiGqFfe2b+FTGYfPO
         Zzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydnI2LeKjKk8DGRO2Vyu2Z6yegZyRC4+HvAXjSsEA0M=;
        b=YNDTMwOlNqwayNnsWpV+IGFzbuHG34ixNTqZH53TF+5nExWtjMZfhDlf+tNwQjztct
         Svwm5GZ3cX4IYR/8HEZQMVnTCm+TZdQQ2hLvIvrRRblC15SzH8ZcEXOj4gGTsUFLBL9H
         ++Hy+ZVhs0zuAxk/3MTl5a+PvQs6Bnqr7KhHD/WjGp2Ys0sSsPiaJZ6K+tClbPEdkzeI
         4J71DGFcXw0cWanC3orf4aHDxkftA2dqDsDpCIEZJMC+A5ZZpCbGFCS59H4Uf/cfWC6M
         isUpI7gSNUbDf2kJjy6dN1CQmVmc1tBXh7qWcI05HaDkMx1Rjnt7nmjXDrIkIpa2IyrJ
         enwg==
X-Gm-Message-State: AOAM5302yh/lYXenWDegfUPEptMJeVzgQSjpAwYi9sElMzmdS873GHNR
        dLf85DfYDMGA9xNm5vC6IIb8zNOkyacs1yDLf6o=
X-Google-Smtp-Source: ABdhPJwXX6miFUvx+sYpjZv1JdoeINpL0MWLHbkxz/GSyth25TmnZnKp0Yhws9kGd4I3Z60cX8V1s9tA4iqKEmF8QWs=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr29564753pff.73.1618312775764; Tue, 13
 Apr 2021 04:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-5-chris.packham@alliedtelesis.co.nz> <2e4e208d-d410-5b60-6992-1a9b8d23f7d4@alliedtelesis.co.nz>
In-Reply-To: <2e4e208d-d410-5b60-6992-1a9b8d23f7d4@alliedtelesis.co.nz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 14:19:19 +0300
Message-ID: <CAHp75VcKABTa3vYUmcHe15k8Jeq0+67_vFbn1nTXO+sH_DDscA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add Chris Packham as FREESCALE MPC
 I2C maintainer
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 8:15 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> On 13/04/21 5:09 pm, Chris Packham wrote:
> > Add Chris Packham as FREESCALE MPC I2C maintainer.
> >
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Sorry for the duplicate. I had existing output from an earlier
> invocation of git format-patch lying around. "[PATCH v3 4/4]
> MAINTAINERS: ..." is the one I intended to send (although the content is
> the same).

For myself I wrote a script [1] to send patches :-)
No more duplicates or strangers in the Cc list.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko
