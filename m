Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03331268789
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 10:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgINIug (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 04:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgINIuR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 04:50:17 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F110DC06174A;
        Mon, 14 Sep 2020 01:50:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so5139903pjh.5;
        Mon, 14 Sep 2020 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=46pmPNqL7RtNf+YDi/f4bnF1JfNTGDIgBl/kbWJbSCs=;
        b=vdlpQHf3/Uv8ZXRH1swj23khB17LJkYmwJjsgjp96KIR6T5yKGncOT+IJbs6zn6vDy
         4Hgmi+/zH4ewsGWbSb3nA0iayhE8aaSol1EE+MsZlc4TcOkLJORx8kvUn0cP+2r2O+fD
         eO8KNWSInYIhJc4+ouTQB+RSeuIfO1PsCXj6GpLV6844DogKFUOECQ8G7+xNRn1U/qAp
         XtWHrO9yhKhMll0B68JbM2C5L2GDvcuEf/wNPSANJdYdaqJyDDkV7VwoCF10Js1tMPPI
         DxFzR1BixA+e3yRp94W9hPb5uINAIo+RvBRBogCzrXfmaXZS4632oDtxrzr6IN2Qi9DS
         t7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46pmPNqL7RtNf+YDi/f4bnF1JfNTGDIgBl/kbWJbSCs=;
        b=WXu5P8o0R6wAyIfU0XHjd4M8V8k+fmxuHu0iQuUb1BuMA0ZRDMno8WSI2ifklBDVwF
         /SRBxFzVD+MC2dWYctihue+HyLc24lgIM3/+OcN9QIe/LkiK2mm9gBUM7bezIMoB1P8X
         +I2Up6q8EOOI5LaLVa+TwwTL3Kp2A6+bizVK1N+R+Fsoozwa1d4E0yW0fdYoyJSeHWhm
         EHFIxqfEcDYtuXgTgm57fVqZMpHAu25iFeOIiZcPn0ogWhyfRDcCrePk/kVZm9AIhfZV
         NFNeqUrs/gJBuYssAnWTJUWhA8TGhlCYltNS5QJnn65sGLZxjWtPg1NRb7C+cU4EyfyF
         Gb/w==
X-Gm-Message-State: AOAM533T5QyL3Gep9RwPjPw4Au3rZ2cB0HgoYCnhrcjGooazra4mWdk0
        NHM9UOFjztNWvD1g7GL7U+gwQ7BHYMpF9al+T3M=
X-Google-Smtp-Source: ABdhPJzrR1ZkR7CdK+Y83FtecEJmiQl6ONgsAco0vSid6Ovpqe8hTOvLNZ0GQCCWtkv0eRb3bgdGSb1xFRUBRkXQ/u8=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr12464507pjb.181.1600073416529;
 Mon, 14 Sep 2020 01:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato> <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato> <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
In-Reply-To: <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 11:50:00 +0300
Message-ID: <CAHp75VdtE_UBsNrSxbVPprmp7=-iVCrXv9x6Tu82b4q2ODfKQg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after reset
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 14, 2020 at 12:27 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> On 12/09/20 7:45 am, Wolfram Sang wrote:

> I'm happy to route it to stable@ if you think it's worth it but I don't
> think there's a specific Fixes: reference that can be used. The current
> behavior appears to have been that way since before git (looks like we
> noticed in 2014 but it's taken me 6 years to nag people into sending
> their fixes upstream).

JFYI: there is a history.git repository from History Group on
kernel.org. You may dig till the very beginning of the kernel (yes,
it's not properly formed Git history, but it will give you a hash
commit as a reference.

-- 
With Best Regards,
Andy Shevchenko
