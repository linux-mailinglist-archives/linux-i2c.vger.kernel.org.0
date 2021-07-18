Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D037F3CC92B
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jul 2021 14:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhGRMyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Jul 2021 08:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhGRMyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Jul 2021 08:54:15 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D15C061762
        for <linux-i2c@vger.kernel.org>; Sun, 18 Jul 2021 05:51:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hr1so23381764ejc.1
        for <linux-i2c@vger.kernel.org>; Sun, 18 Jul 2021 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GgDX/gDdFzff38eVLEbKWZCi0IIuTpi3FYNjXmZlnds=;
        b=ganJDQm8LclKiMhkWYCbqQ/6kZxjOkkzyMGSSg5hBJUp2zS9joBQxeR1CtgcYujpoQ
         ytQxOXpJ6OIEv+d6bvK2eZCpODlSc28s7JPJTi+BwGErICvuf9AjZJWD9xa/jnYuPETu
         WZyjlGuMkkjdQFBRbyo/sC3ZUgW0WrH6EWGotnLwhHUu4Uufj8R3Mpa4OE6kLzGfFK5A
         prMVDQN0R6QpwyPaNx5f4fi1JovpHF2Vhc6VdziVdcOhIk87jhA60xXS0HNQ3uqOGIQe
         nsPT/Qt4E21SvbxAkSNpr1eUAmpFW2j9/uwhxkGlyWJc8avcj1m4EQl35oD1Gz1IEqne
         3uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GgDX/gDdFzff38eVLEbKWZCi0IIuTpi3FYNjXmZlnds=;
        b=PkwA5XUANv5ObEbJYhguaEtefoQRWiuuCL//5P8n6GUJhZgR2BYW4mJBiVBdTb+VUe
         3ZiJSIRfi+MsnMkDp1lNRyXfHhvfw9FLV3YJV57qH271kEHP83fXrCpsgsiRO+6nAw9F
         ng3kBRoo0IqscxAZBDhLGjQLTFTnU+s0tWpi11fkAEz9xx1grUk+Uqmsc+6vyqrrDd24
         /RIJ5ED9yDb4+ZabnJcHc7lKqZKRMj7GEJFRmpqjQaB7lLnkwJPu1JHFyeMqmkUO6+CP
         HH720EK/3CXj3JbdY9cdQNqJyaiRkVQ/ZhZ3U6jPl0U0TZG6pdBsCcfVANEN7WKbFZtn
         8hMw==
X-Gm-Message-State: AOAM532YaCccsCQuI7mV7cgEtXS9xSAmxPfCsBk0TdOe4ZdJdpc9jGrh
        qwAzidTDf43I6e5G+TNAqsb2JyGTb8tZ5jL8seEcz8/eRhc=
X-Google-Smtp-Source: ABdhPJw8p0uxj5aSXFZ2tueSYRJGIdL7kxHds9KD25zbKp+CCBxcoJnvnuIOARIicLuWItUBQsIMR4xfiQkYb7qsFp4=
X-Received: by 2002:a17:906:384c:: with SMTP id w12mr22545936ejc.445.1626612674863;
 Sun, 18 Jul 2021 05:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210705093314.20322-1-brgl@bgdev.pl>
In-Reply-To: <20210705093314.20322-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 18 Jul 2021 14:51:04 +0200
Message-ID: <CAMRc=MciijLbimum3Bs+9DJLQm72voBZCc0D8h97ZRtEioN5MA@mail.gmail.com>
Subject: Re: [GIT PULL] at24: fixes for v5.14
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 5, 2021 at 11:33 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Wolfram,
>
> Please pull the following fix for an issue that was raised recently on the
> list. If multiple eeproms would have the same labels in the system, the driver
> would refuse to bind any other than the first one.
>
> Best Regards,
> Bartosz Golaszewski
>

Hi Wolfram,

Gentle ping for the PR.

Bart
