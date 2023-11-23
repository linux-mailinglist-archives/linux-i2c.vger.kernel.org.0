Return-Path: <linux-i2c+bounces-395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363AE7F57E6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 06:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CEC1C20C9A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 05:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F52DBE5B;
	Thu, 23 Nov 2023 05:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG0XtYAH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12600191
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 21:53:37 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so61521466b.3
        for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 21:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700718815; x=1701323615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lovwCQ5LMuFRkaWZgi8g2zkAYUc81iOG0XuMLog8jAk=;
        b=iG0XtYAHWKpUL3vbEwlI8OdLK13EMCxf/geAnzsXOkWOIhLyIl0bFEIfAcKVEIw6lw
         8SnvQl59HkhwAec+eEoQ4Z/p9Rgdf3Qv1l/YOM1bIp//HFgxrLJPFDP6Lck/ZkOYoXUB
         CMTCHxhVEWDEoFgJF+uC2cqL2tVq7ppRtkB8pPe40nnJM+V1lkY3yqUTHl9X8iI7qeod
         lEEUK/mXAtEtYHsek7DLENmOBWb3y6n1J0kTMaW+fR+t7HBTyv6QHbud3jmznG3EFOu3
         GyAIIHx/REdkViJQUf6WaMx7T+9/Y6jvfGFib1FTCK6VYCe0MaL/+W7+hYM6jng+YXVH
         OIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700718815; x=1701323615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lovwCQ5LMuFRkaWZgi8g2zkAYUc81iOG0XuMLog8jAk=;
        b=JqA5nJER+OQNN1e7n1/zKb4t/9xEjTK2hkmvjoOOLTkCqNxboCP5vkMnWAZskhnlVk
         cs7Ge2gqD1mZkN/jqhzwnTbYV6aZbn5NL4679VymnDf3oc4uBMheQnVm4i95bc8t6RqS
         RPRoLM7xsTyG9wmvPGt2amOx7kJjpsFJVvNTtZXD6xtBhYt3C8pdCEI5mm/20iE9+48L
         uc8q4NpdsebG8caE+Bk9Zj8awV2mRa4pfpmJPoamgHiEyEoFvIJMLRUrtRshF3MDINVR
         cNx7fDownEftI6rB6RzpcpZRnDXGdpLm9e2g5GCPG2qYpO3K/PLge6DJFF9PvmxLJyNU
         qTiw==
X-Gm-Message-State: AOJu0Yy4A+nuA2N60jgFkQIRx57SsEJYEnnKw48x3XwwlSwue/SUD33k
	xlalf+KMCM+KB66LE7KoOtdYLQ9g/dDrLG2cjfg=
X-Google-Smtp-Source: AGHT+IFnusxPZNCN+tWvK9sHSEzZXOz0mrbFean0bSIzw9XOSGxvydJO9eHyLdcMilm6PxQWe6vV1/VYJ6rutzs2Y6o=
X-Received: by 2002:a17:906:209:b0:a00:2686:6b42 with SMTP id
 9-20020a170906020900b00a0026866b42mr3304564ejd.10.1700718815265; Wed, 22 Nov
 2023 21:53:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121180855.1278717-1-robert.hancock@calian.com>
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Thu, 23 Nov 2023 11:23:23 +0530
Message-ID: <CAKfKVtGT1Aq8gQR9uazjm=yGjRRTj-cKYe-_4n4ME3sThaPTzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
To: Robert Hancock <robert.hancock@calian.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 11:42=E2=80=AFPM Robert Hancock
<robert.hancock@calian.com> wrote:
>
> A couple of fixes for the Xilinx I2C driver.

Thanks for the fix is there a way i can reproduce the issue reported here.

>
> Changed since v1:
> -Fixed an issue in first patch where an additional message could still ha=
ve
> been written to the TX FIFO without waiting for it to empty.
>
> Robert Hancock (2):
>   i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>   i2c: xiic: Try re-initialization on bus busy timeout
>
>  drivers/i2c/busses/i2c-xiic.c | 61 +++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
>
> --
> 2.42.0
>
>

