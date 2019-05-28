Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17F02BE90
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 07:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfE1FTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 01:19:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45753 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfE1FTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 01:19:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id r76so5589841lja.12
        for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0wSEunJcuU9LxlhK6/jeN+IBcFuAji7bY6x3geRWprw=;
        b=Cc8uamhkZOWwbYaELS0Q9J5BQvPbhniLvuW6GNgTpQ0/56RPnzHlQ+/sdss1sE9yXI
         9xP9BAiVtdQk8+SiuBtPWvqVZx6Zi5r9njViH96breglImAWkmDpc3vfD67xbg0LWr11
         IOqa2WaoE0N6DZVjfA5+xlYL8PubAEjUIuFi8iK7Vi+lOHN6G0YTFH2VOOAoSp2p+4SJ
         3xo+wHwNpJIZWw0vxVNwsk5Jjo1k8vw0+tj423IB0aQhI6jAsTgXpyvlA0M/2yhUPulf
         +6x1tBo0e+OTHnNa0jeE2Kck+R5IdOAcAGfhtXSa4fx6xNh2PJnjf7k7ti1kxkGvp6+1
         LcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0wSEunJcuU9LxlhK6/jeN+IBcFuAji7bY6x3geRWprw=;
        b=UDTP/i/BkFcVE4JjpMaJdQbhlDUAEnpiYTGqAEUl0svj+eCERN/B/cN7Wvigxikb0X
         osMo5n5iiK0EkFTk3HEuANRXa6GEYor4M4QB8ld0OqRqCWg785GSSTNTvDW98PPgRQiG
         OoWbk85BDwbuNfCvzsrPxOxP0R82tQVeXm7IiiHl8psPiDjcIZpUv42FH0J1llR5eT1e
         T1E9t+LYWtSGLncyXpyKegj10TlRglV7w4z5mqrXXGDlRhkqMV1VjnwkjpMgGVY7Ja09
         Mk3bIrP7o93Jrs4mWFsBtXqFfRiSa2xFqg9AhIROmbhAEe+3F5SIE2dQxi4g63I0cNqt
         x+wg==
X-Gm-Message-State: APjAAAX2JNwfo9i6/E3nCvTDet/cLWL98r5xL4QnKIF1NELAaBn9oWnX
        /Pvx+HF+sUZ8X0hbydkpgRiRGDS/B6Pp7Ir3Opdp/A==
X-Google-Smtp-Source: APXvYqwhpyHLFeyv1L33b9Z69WfnSRiIG0wwkaZH5Orj/bBuZUdfSlmG6YoV54raM78LN+qhS0DOt/ZDDiZ2Jp4IjDk=
X-Received: by 2002:a2e:9692:: with SMTP id q18mr18914588lji.89.1559020792049;
 Mon, 27 May 2019 22:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190521013350.8426-1-masahisa.kojima@linaro.org> <20190527193418.GI8808@kunai>
In-Reply-To: <20190527193418.GI8808@kunai>
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
Date:   Tue, 28 May 2019 14:19:40 +0900
Message-ID: <CADQ0-X8s8=bDBY+OiytNbEtf_cZV7Mf7U9NQKb+arMk8WhUcjQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Satoru Okamoto <okamoto.satoru@socionext.com>,
        Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 28 May 2019 at 04:34, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Tue, May 21, 2019 at 10:33:50AM +0900, Masahisa Kojima wrote:
> > master_xfer should return the number of messages successfully
> > processed.
> >
> > Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> > Cc: <stable@vger.kernel.org> # v4.19+
> > Signed-off-by: Okamoto Satoru <okamoto.satoru@socionext.com>
> > Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
>
> Applied to for-current, thanks!
>

Thank you for merging and your feedback.

> I just noticed you have an open coded loop in synquacer_i2c_xfer() which
> should not be needed because the I2C core does that?

I'm not sure I correctly understand the meaning of "open coded loop",
but I2C controller status such as lost arbitration and bus busy is checked
in the retry of synquacer_i2c_doxfer().

> Your code does a HW
> reset, though, but is it really needed for a lost arbitration?

Other than handling lost arbitration, this loop also handles following errors.
 - transfer fails(expected size and actual transferred size is not matched)
 - transfer timeout
I think it is reasonable to reset the I2C controller before xfer() retries.

Regards,
Masahisa
