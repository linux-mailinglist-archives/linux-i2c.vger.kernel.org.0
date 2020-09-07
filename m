Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7E25F534
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgIGI3w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgIGI3u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:29:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEE3C061573;
        Mon,  7 Sep 2020 01:29:50 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so1984974pfd.3;
        Mon, 07 Sep 2020 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0f1kClEfUN9vOMlaH0+x51cMOCCsINHwvvJvVM37cBM=;
        b=P3xD9cbZfHZPtFtsysOPCyYyp8eidyu8mE2PKXvWYD2Dx5cgoftG089JPc3WJvKwo1
         BjDXq4oQ62sY1jw3s1MVG7mlP7MGZ2X+YziudfaGhrHssu6gPvRVg1Iy+sZ8jHcZscG+
         DsfOtYCFwmS18hkue7qbT3yGsKSbsq0KRUj/qpjLCcKNOZErl3jxFyJ1ktZCtaJhx8uR
         Tfl3gkyy/LS++V09WkXlnntxn4MFs2/3Aov9fMgEOjWXvQEbVya8XdfDEJHdlguHzQGt
         +2dptrG4NRzK6QnNbJnivWYWynO8rU6mMBFHtZn6cqs72hpsjvQjGUTS5ThfigNZTvdK
         3JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0f1kClEfUN9vOMlaH0+x51cMOCCsINHwvvJvVM37cBM=;
        b=coemdqqi1+ycZJpq4fNVw5WtZ+1SHFaZuOhjW6vkiRaWeRogoXohk/3QXrJ6gq/x9a
         rhry8nU4p+NCwyz5KzOw6RPwlJAixNrlBHAv4cM2bLed4S7HUTpfl7PHFBbDPvPn6s7i
         Qaay9ttDwPzP+33wnp/T/6bQL3BLsqFSo0J2DMZAh4k856HJaFumKx7Qx4gc4H4sa/cf
         3NvQTOB1BrLww5XCTLz2G3CaWl4b5mW93vLOdF1gRazwnf67pQzW65prR7trbeFOFWEx
         I81KcC/myz/FK6UofIEBYjfqgLCHlaB3vmD61I5uQCWnHWV59G0DJYn9f67iUXtaAZQ4
         lW/w==
X-Gm-Message-State: AOAM533EuoMVUa3xRkFaclXDMQfAE+s1GGmXcrc7jHLu1fZ64po1Mttk
        QOAvBCML8WGiu6+9LilpJk/ql1doA2g+hULg1nF4oRp54l7Q6Q==
X-Google-Smtp-Source: ABdhPJx+Joq+lJwsQ/veCATMRnu5nL+AvjOdE8iA0uIwKffjNG4yvO72nW1QcKUc12qAEjy3g1J6sjcwwT5+JRjBuDs=
X-Received: by 2002:a63:d648:: with SMTP id d8mr15984014pgj.4.1599467389957;
 Mon, 07 Sep 2020 01:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-33-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-33-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:29:32 +0300
Message-ID: <CAHp75VdMus_jZqb4d3t6qXcRzwfO7Ldz7W+pnaCS-7B+ys7WRA@mail.gmail.com>
Subject: Re: [PATCH v5 32/36] i2c: tegra: Clean up and improve comments
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 6, 2020 at 9:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Make all comments to be consistent in regards to capitalization and
> punctuation, correct spelling and grammar errors, improve wording.

I consider this a bit more important than the previous one. It has an
affection on kernel doc output. Thus, I would recommend moving it in
the series early.

-- 
With Best Regards,
Andy Shevchenko
