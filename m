Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB26812E913
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 18:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgABRGH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 12:06:07 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:35710 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgABRGH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jan 2020 12:06:07 -0500
Received: by mail-io1-f68.google.com with SMTP id v18so38918335iol.2
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jan 2020 09:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/A5dGyzIQiztm3ebQbxjtdVfOUtGVswoUGW+x3b7c6I=;
        b=GrjQndJIEwMcSjeFBxpfu0biYuRCP0zuKT6QTGeN9hWisiAQ8eRK2I5lVLQby3x9yP
         hKAnLv0KvLT8JG6IpnDNVINCkO/05wIxOmBFp69pq9Sa7e6EO0QjnLjMpatmCTDNWp6t
         UPVic+bu5tAKaY5850c14L8+kelb09leGOTuKzupINMAxbjCc8PCKE719wAD+ZPDA1i7
         Jr6pUXI8HsN+7NdI+W6Nr5sJBsHT6SqfAUiONJrBxN5klrXS/9F1TXSJIBifoghzxOHM
         NqIhXnxz5oJzjkP+2rK2pwsY5UCtYerz3pSKC6D9FWy2N0mdHyDslpZqtt3P+n1t5vNR
         1sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/A5dGyzIQiztm3ebQbxjtdVfOUtGVswoUGW+x3b7c6I=;
        b=BJigVWsfgWjtSCE7i1ht6tgkdY/dVUmL9liOtdfzO3eCsuqzgcRaPaFSv/qqCclVqk
         SseWHEvljWF//nE7ciXDYgfKyNGi/v4e3FdPpV19CaSc9t6AIOKF6pPaMKOLLWr94jHz
         4VOe8emuKp2nfwd1KvPBFt1aA6BJvvhcIHwb51fvEBzGbekf8blTFfWsKVbJwqhO4HkZ
         v3GZ9A6kPgEwPS5aHMCfnNp/FaUjvwCLZlXHZ8DvHm/czVRrwFpXntDvUBXZzQs/UnAb
         K1wcQHeh9QIVodyu5lm/zBAeYpETcopdIA90/9kmTg9Hj6IQJXJLzeVYxs6kIZL4EKxq
         UdRQ==
X-Gm-Message-State: APjAAAW6z9s+0cOsWPLil4BAI9nNObBbVOneD6DvNGM5nX2GzVnpwSgX
        cLHdz653S3OFUCau1erMuAwJxxk0aXc3CQlzPFmpeOH5
X-Google-Smtp-Source: APXvYqxhZhsziTYws9Yi363DCc9VgAJMxJjFM+ztJeLnl7Pe0qyBMVniep+1f997I1tvFJkYFaT7aLJs7eGO7r8Kctc=
X-Received: by 2002:a05:6602:220b:: with SMTP id n11mr57530135ion.6.1577984766807;
 Thu, 02 Jan 2020 09:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20191219104055.6483-1-brgl@bgdev.pl>
In-Reply-To: <20191219104055.6483-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Jan 2020 18:05:56 +0100
Message-ID: <CAMRc=MdYZ8+Hxa+mPXuCQi7icHrxAa+yS=6PmACVQ8ciRvkoBw@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: sort headers alphabetically
To:     linux-i2c <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 19 gru 2019 o 11:40 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> For consistency and easier maintenance: sort the headers alphabetically.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Bart
