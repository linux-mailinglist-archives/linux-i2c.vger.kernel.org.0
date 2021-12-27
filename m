Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A747FC3E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Dec 2021 12:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbhL0Lez (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Dec 2021 06:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhL0Ley (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Dec 2021 06:34:54 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0EAC06173E
        for <linux-i2c@vger.kernel.org>; Mon, 27 Dec 2021 03:34:53 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id iy13so13198919pjb.5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Dec 2021 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jd2KJ61wX8nV+l4qEphFCwhVfyjEv9bxYKlxVpeMJ2A=;
        b=NNDIgnSEg2wLqr1Oah+q7fFr6cEvL+XAs2dTBnebktoahy5V/7IDqoIVmDml2y7xLF
         Ut4jMnLGvDDHVzxqlJf+Ynttv4Ic1EUknE0q3JEfur2QWx1eilkEgee0TduEPGyIrLsc
         EJxYchls9SdEkEUV6XGuSBB70l26a0m3Eb35ESP73eZtOzXVr+CNJLgbyjkWMOdu+vZY
         CAQee6i5GhN4fwm5i5PH2B50PialLZ4pjsJKbeSkpuun0xtHkzqRe87aPcoa8dkmJVjd
         rbh5mEeCRS2Nv+1E3xQNoCwMfYrGWk4QrCNXJCscG1SkMSDD3P84vZaUlmgZu1naYSBz
         F+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jd2KJ61wX8nV+l4qEphFCwhVfyjEv9bxYKlxVpeMJ2A=;
        b=4zM4CITnZ+27cvASVwH0uyACXYfysCM2YJc7JyT607h9pheSfNO/9mJ3yJF7NaAECS
         MPJdB27pjo5sY5z+0ejHvxmw2t2rbZJ3vEzZjwVKBWXAN5jW+nMiJGX800DNZHlQ9+Gh
         OOCAcj9zZvpBbc7rDvWCunJUwIpJN9YtloDqxMSdIzHM0q5zSgPwtIG7vtVHx6rA5Fx/
         EFb/xQ/0fLMm2+LVTIJtmUd6cGXwlkw7l+mNPAHdlXjhqGle6A7GsmWzF8Y9O8To0ONr
         wptvKOdHxV/eemXn3Oh/WQgkoTwPycC94X7A2Osz8XMuGL682RrwjTwXG3db/2cZlUGD
         hI+g==
X-Gm-Message-State: AOAM532XHvMuqh7VzyTVXkxF/I7pf8RC7IyDQcACF6Jtw5+34/kf2DMc
        RCTjAjLkb96pgiRV8gLImrIXvK+dhSJoBqn+fPoMpw==
X-Google-Smtp-Source: ABdhPJx7SqYM0Oy0x/uoDjZKqUvD0JXYlvnirwPp9gvGxyGaCSbFU0OFSlw1IZ6WFjKfztl1+LS/626aO+jtG3VCOd0=
X-Received: by 2002:a17:902:8c92:b0:149:848e:e337 with SMTP id
 t18-20020a1709028c9200b00149848ee337mr2912718plo.139.1640604893476; Mon, 27
 Dec 2021 03:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20211222094558.2098791-1-jsd@semihalf.com> <20211222094558.2098791-3-jsd@semihalf.com>
 <a1b47be4-f208-1a59-d704-99a463bb2fe0@linux.intel.com>
In-Reply-To: <a1b47be4-f208-1a59-d704-99a463bb2fe0@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 27 Dec 2021 12:34:42 +0100
Message-ID: <CAOtMz3N=BPfudoamy3dVUZ6E07_Cw0OD_mJgZRrX+UWnY7c8ww@mail.gmail.com>
Subject: Re: [RFC 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 23 gru 2021 o 15:37 Jarkko Nikula
<jarkko.nikula@linux.intel.com> napisa=C5=82(a):
>
> On 12/22/21 11:45, Jan Dabros wrote:
> >
> > Introduce new CONFIG and add new menuconfig selection list in order to
> > allow (optional) selection between baytrail and amdpsp semaphore.
> >
> For the Linux distribution point of view selection must happen runtime.
> Otherwise either AMD PSP or Baytrail semaphore support is missing from
> the installation image.

I see, thanks for your input.
Will modify the driver so that it should work with both (Baytrail,
AMDPSP and potential new ones) semaphore modules compiled in.
Executing probe()'s at runtime will allow to select and install
correct callbacks.

Best Regards,
Jan
