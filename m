Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E213D3A1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 19:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405455AbfFKRKf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 13:10:35 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44591 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389356AbfFKRKe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 13:10:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so7808092pfe.11;
        Tue, 11 Jun 2019 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QfcRtoONgWVTwtnQoP4rlwBElT3so0FbJIuhPmULhig=;
        b=m6uDPrf0xbKxHOBxlYlJgBJluDseTqpUrZe+FhasYzB64ReBzKMIdV5XGEhIGV9N+T
         GciSYgvch7xUNYa81gxMPnMByXHKgU/Oyv2MWE9wocowq9z8bHYJcScjGr0PcGcTVy4I
         lGX1/Dn9Pq/uG79uFh2Z+2aImHK6qBLTTR6lwi3S0LODaisIL34fRlEQ9XyAQWRucmCq
         gxSvkYh0kzEMswZuMDBdN9iubeyxHBLfT0gAiB/xF3+YWiYhw8eQQakd8aQ1mSs0vc7O
         SCjhUKvcmVw0/pQC222MOMCTzDBLJNwhJoJ9HST5soGEe0+2ih1NjRliyjzmVz3qsaNq
         dc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QfcRtoONgWVTwtnQoP4rlwBElT3so0FbJIuhPmULhig=;
        b=oFvjPrHxfAuJsU6BvBEklWdbMtcEUe+Zv+JGE4+CO5RhAqBAA6npe3KRMwBv+q+Naa
         Aq24fmJHpcfw0+nxE3VOPdTv/JFvkL/QQiUwmEPI/224lsVercjHWrIhnOZS71KGTl9y
         m3sUWujZn3c01XPr/1B6pgLf/1s85DG3poEYdhgHdNLm/Q/bJEn7DGNG7eCqT9/4yqLj
         ZguVZBl68BXFvHtERW3F+XS0OBFEtY6G6/CnTOmC2tPNptBowpZ0ltOHLsbbAP+FJuPq
         wUdHb1E74Vz0RNRsCfkO6pJUQc9dh5D7rxUIdYvnHQHgNxXwTtzIMZdcXd7eMpNgXxY5
         eTSw==
X-Gm-Message-State: APjAAAXojb2UGebfQEybAbsrgmnACc5UQWOIF6KdjMhto9mmM9lP3U+s
        f0cGRF2lzoNyf4noVY3CCh0=
X-Google-Smtp-Source: APXvYqwMksWM0B/q19Q0jWzNmvs/opGNhXpundemVkKe3ekBw/AhIEcAanhmfVC6alp8iLNfynW0+g==
X-Received: by 2002:a63:eb0a:: with SMTP id t10mr19060142pgh.99.1560273033558;
        Tue, 11 Jun 2019 10:10:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p15sm16391934pgj.61.2019.06.11.10.10.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 10:10:32 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:10:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, gwendal@chromium.org,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@collabora.com,
        dtor@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        alsa-devel@alsa-project.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-iio@vger.kernel.org,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        Brian Norris <briannorris@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        linux-input@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-pm@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Evan Green <evgreen@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 06/10] mfd / platform: cros_ec: Reorganize platform and
 mfd includes
Message-ID: <20190611171030.GC143729@dtor-ws>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or
> we have a linux/mfd/cros_ec_commands.h file that is non related to the
> multifunction device (in the sense that is not exporting any function of
> the mfd device). This causes crossed includes between mfd and
> platform/chrome subsystems and makes the code difficult to read, apart
> from creating 'curious' situations where a platform/chrome driver includes
> a linux/mfd/cros_ec.h file just to get the exported functions that are
> implemented in another platform/chrome driver.
> 
> In order to have a better separation on what the cros-ec multifunction
> driver does and what the cros-ec core provides move and rework the
> affected includes doing:
> 
>  - Move cros_ec_commands.h to include/linux/platform_data/cros_ec_commands.h
>  - Get rid of the parts that are implemented in the platform/chrome/cros_ec_proto.c
>    driver from include/linux/mfd/cros_ec.h to a new file
>    include/linux/platform_data/cros_ec_proto.h
>  - Update all the drivers with the new includes, so
>    - Drivers that only need to know about the protocol include
>      - linux/platform_data/cros_ec_proto.h
>      - linux/platform_data/cros_ec_commands.h
>    - Drivers that need to know about the cros-ec mfd device also include
>      - linux/mfd/cros_ec.h
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
