Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F611356E1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 11:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbgAIKba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 05:31:30 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37197 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgAIKba (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 05:31:30 -0500
Received: by mail-qk1-f193.google.com with SMTP id 21so5486247qky.4
        for <linux-i2c@vger.kernel.org>; Thu, 09 Jan 2020 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SIH3Ne6v4PFkZV6VUGUzjoFVUhaLqB+lgrvUawjrMYc=;
        b=oSAFRUuI/WV+Ymxkmqk+o2KoSZNYBI6zkdW782vrphCc7w6DF+HXx4WL5QcCrgPKWM
         w8Zd/vouvnJom/empxWRyjT//3ljh5eDMjX4BoLsXZMMApwg2XAB0d21u1NeFWjdnKC3
         NqfR7arNPf2N1W64klSU7LmQqd3JBdciWX4Li4fXnwDgI5UiPILsQ6zrMtpaFqbsTqpV
         tDuMxNUZukDdIqFswXLJMym1lcVhhkamC87dUCGPwRslHSDiMh7/6A81uVST37sgAlJY
         TrjuFjdzJI+b9MUPZ89sAu5kMrZpG7AqfI57rwrbSc7qKO1FNy436ko+mA33nMcLvne0
         G3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SIH3Ne6v4PFkZV6VUGUzjoFVUhaLqB+lgrvUawjrMYc=;
        b=HUWqkxHQ9pEZux7XmAh2yrR4yFeeqgtqAY71lHlRAt5BgZNYh/2Gn4hllk5PTCyf/D
         Xip77Pw4xk7llHYhRZ7pjc0wFQPE71ClsBIs0Lr+EZwL+UuBNT10s8Q/psD5oEeEhUuD
         POcrhEWDE4p+P0zdMkINnPGAS17Qu/KNy6pILF+5ccRu21etVx0WDfJl58Slli/09BYA
         cWCWymMoRFKGuPhD/Az/OBmV4rnyk1L9DOSy1jLJIQTtVm7LYGNqri6buIzc9Qx639Ez
         +aObqhY2e+3G63u3eXZb2QdFWWwEWxdGhhrfGsR6pqQ0AQlOZE/TAc1WdXIzooVTT70w
         MNGw==
X-Gm-Message-State: APjAAAWp+7hMb+rl/jFkEf67pDSLyIM4On4GJ96EEwQITbmZLRF1Q3D0
        bR7N7DkjPYuAA1KPugv85AAjpF6DaYM8WoWJrjR9CQ==
X-Google-Smtp-Source: APXvYqyuv1+zcik5Km8uc+VG5tVlFqozxu7U9959A+DWpFFqIOkOabtR5WlV1vnJUCEyIZ0zqLgdQUhYhHYvx+7h6dk=
X-Received: by 2002:a37:6255:: with SMTP id w82mr8824719qkb.330.1578565889528;
 Thu, 09 Jan 2020 02:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com>
In-Reply-To: <20200107092922.18408-1-ktouil@baylibre.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jan 2020 11:31:18 +0100
Message-ID: <CAMpxmJVj3DHXFq9D5HUD0j7t=Q7gFNF1eQsg2jUa4PEFrFas4w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] at24: move write-protect pin handling to nvmem core
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 7 sty 2020 o 10:29 Khouloud Touil <ktouil@baylibre.com> napisa=C5=82(a=
):
>
> The write-protect pin handling looks like a standard property that
> could benefit other users if available in the core nvmem framework.
>
> Instead of modifying all the drivers to check this pin, make the
> nvmem subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
>
> This patchset:
>
> - adds support for the write-protect pin split into two parts.
> The first patch modifies modifies the relevant binding document,
> while the second modifies the nvmem code to pull the write-protect
> GPIO low (if present) during write operations.
>
> - removes support for the write-protect pin split into two parts.
> The first patch modifies the relevant binding document to make the
> wp-gpio a reference to the property defined by nvmem , while the
> second removes the relevant code in the at24 driver.
>
> - adds reference in the at25 binding document for the wp-gpios property
> as it uses nvmem subsystem.
>
> Changes since v1:
> -Add an explenation on how the wp-gpios works
> -Keep reference to the wp-gpios in the at24 binding
>
> Changes since v2:
> -Use the flag GPIO_ACTIVE_HIGH instead of 0
>
> Changes since v3:
> -Keep the example of the wp-gpios in the at25 bindings
> -Add reference for the wp-gpios property in the at25 binding

I picked up patches 1-3 & 5 into the at24 tree.

Patch 4 will need an Ack from Greg.

Bart
