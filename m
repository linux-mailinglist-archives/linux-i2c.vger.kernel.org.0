Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA882248645
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Aug 2020 15:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHRNlu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 09:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbgHRNlo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Aug 2020 09:41:44 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71626C061389
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 06:41:44 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b79so18202851qkg.9
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLt6S3l3x9lKUWJCeZKz0RKBDT/EdUrdyTV1gz77ujA=;
        b=j8yz/nElIO/ikK9FL5AGPATBHMYoI6bopdHJhw9lM48l9hUfryyj8V5xSnzoufHR/I
         68ahlAhD2K5kJWHFQ4p81D0kJ8Jb5BysJ0ulWJnPfsaH7kBsXo1df6MgPujntcmVdRma
         vPfkzdHLH+o722VIju9eHUcC/oJX1KqhRSOxAu/8YPYf95M0WAlf5LmQ+tvKT3eWtamd
         27vc8NVoB90TxC+yUAvRCugYAuMzyljpyht++Kln4r3tpwg3QWWwAWYRU/ZLKiwy2HMO
         Adlk6buQH+Pou0hNl60XPTyC8qdp8W5t7nWDM/njfsH2sHI+NYMAKr/vxZrpVjkPpNtb
         QuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLt6S3l3x9lKUWJCeZKz0RKBDT/EdUrdyTV1gz77ujA=;
        b=YyuftvbFfBn2giYEOkhmxrn1LJ6nyxM9uGgh8MEEpt0GBUaozZ7GulN67IEhgTkbUW
         LU6mnNJuY77ooRWmSriNAShH9cidKlHfmHhXQLWZ1O374UtpKrSJwFmkiTb6ZcvCBuyQ
         SYsRr/qW546iNAiAPIQOOLjI8s+U/XhTA+3SvMBxLby+Hy2tSrvVl2G+SIwvghbErlUM
         5JNRcsV79qtIUhjKyiq/2yB90KsSY6QKMzDlMylHDi39et/sAojdZhQimO/UjUCF3Lxc
         mFBbeXkLKY/nqu9hNj5VTi40+FzNTSc2pQhA6O8ACEqWT7OwTbnEoB/AzIwBsKxjiJ53
         9LkA==
X-Gm-Message-State: AOAM530xO2leRT0nxBQAxp9uK102FocJ8ymrEEUZie4ydjszS8pXlbH8
        mC1UrFHaoZFePj3jBlXLibBHaMM4KR1ytMzpcQsMyg==
X-Google-Smtp-Source: ABdhPJwvLY4pktNhcqAtyjrCB8VLlWVz6Ek+7ixMaFpga3pccFS8a7sTNYYeNJZHzQutWHArfhHDj1Mel49eyGFd9a4=
X-Received: by 2002:a37:a495:: with SMTP id n143mr17617572qke.330.1597758103624;
 Tue, 18 Aug 2020 06:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200807150005.48c8c89b@endymion>
In-Reply-To: <20200807150005.48c8c89b@endymion>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Aug 2020 15:41:32 +0200
Message-ID: <CAMpxmJWUqCL=QRfrFdTh7E_PmJd8WL+yY5U+d1YBPtg8GRTuJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: Add support for the Sony VAIO EEPROMs
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 7, 2020 at 3:00 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Special handling of the Sony VAIO EEPROMs is the last feature of the
> legacy eeprom driver that the at24 driver does not support. Adding
> this would let us deprecate and eventually remove the legacy eeprom
> driver.
>
> So add the option to specify a post-processing callback function that
> is called after reading data from the EEPROM, before it is returned
> to the user. The 24c02-vaio type is the first use case of that option:
> the callback function will mask the sensitive data for non-root users
> exactly as the legacy eeprom driver was doing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Bartosz, this is a different approach to solving the problem compared
> to your suggestion. It's even more generic in a way. Let me know what
> you think.
>

Patch applied with a stray newline dropped.

Bartosz
