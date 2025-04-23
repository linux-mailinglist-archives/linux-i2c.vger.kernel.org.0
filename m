Return-Path: <linux-i2c+bounces-10592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE38A988E8
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 13:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6BFD3AEB54
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 11:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4A52144A6;
	Wed, 23 Apr 2025 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdFj3euN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E192701B3;
	Wed, 23 Apr 2025 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409000; cv=none; b=qb9IafcGBZVWeCvobbTD8NsG8IfmY4JdGPCJ5N42EPIOMMKMG/C5itV15HpWcoJwqJLqG8nufyrrkng2sL03GFPYfNvZ0E5d6zjedjtuoqTPjwKeFPsfP9JqFQ+TFNe9Fjp2fv4WHarpphdh4scUUsCn8JSkRp03hbYG3sOWtmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409000; c=relaxed/simple;
	bh=IvQu+jbnWzWXq1blFUfteGmtw2BeRezi/dJWoQ+mRt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5vkCPMRfS1iYk8yANymRFERh+S/gGUGg7y9kRnnTq1EKbEZ3F6QK4C7JEgcW7RmG5T2FhBDE35Je5lwPgFoeYd3BTcCY2V9cZSKExBJNg1TbnA4MsUT+V/LK1AUxHCG4jJtDk3JToQpN86x8gfkIw5FkSgz6kxx19dxF6nAoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdFj3euN; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0ad74483fso71052056d6.1;
        Wed, 23 Apr 2025 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408998; x=1746013798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZF7014zSu+AQoCx4OYhTEIFB9N+lwuTshRQiSyO3Fs=;
        b=KdFj3euNSvsoJxvXmdZcQewi27khXLCqRHFLF016igRztDpeN4yte0SwMuBpa+Uh+D
         sgjgV0n9VMRQpyvKw0iqR9PptUQGB2+d7B/eWhndKwd2qBzbdbSeOvbx5pjQ2n3vO1mW
         OFpMLTN2lL4LeDJZuZrlsAHB3tUGqVmhcYOVrgbWHzn39e++LeLD419My4CArvDmVVYF
         hi1D2bzahyB/GLH3hUWO9lLV2hj7L6xtiWTcgdsuh15N7SiEtx2q2uQN89xx9piF6+zv
         cqdGrZ52tLxAFJ92gAyc2J9EAbk7aJ7F+ZuFZsgs9T4vmSVNkHkvERiovwejCAzSFkeC
         YWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408998; x=1746013798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZF7014zSu+AQoCx4OYhTEIFB9N+lwuTshRQiSyO3Fs=;
        b=NgpFpV4+WeQEyMvMji5O60siz8cmNtzjtgfUnTJPK58NjbuCgGZhDQCQcJYIQS9PFM
         UM+x87R4+idKCJmPkGqF6wCxlCiBk8PEx1Nz4H1rMFofjhlDC9Xn5mGArJv6E80e961+
         tLss7b/qYdW6KTumYaEGWiQxzXbUkJ025PIcrMrRDfmqy/JOBmCUPy7+6LzGHOOLUFU5
         EV808i9T6xbNntpMaW7ePo+7ISXlurAevVit/JBhBN9dCWlXuGKD7F7vD/EKkHeaWFDe
         e+lyRKvPAd9sB3XMoJl6eoT/CG3KJezBHVOKbxyrwb06wkSvRmH50GC+VtzACDs3Dk0j
         wGsA==
X-Forwarded-Encrypted: i=1; AJvYcCV54ieme5VbKIicbGOJT0Tle7zGQUsGfbnzHBT/qMD5tTIwKdqenG3Vk7Y3epRaGJFavoqYnIoc@vger.kernel.org, AJvYcCVGYWQsRysyHAze2Re/f4kYHAzDJV8QLd+rPt38hbZZOe4COIo8p21pcxBlrmms/Yp+3uFtJtv5nfan3SfG@vger.kernel.org, AJvYcCWPsky9R3vxH5U/qWqEJ8z4vUAIHY7m3tAYbu4Ae+XFeHcyJ3WnsVQywe4dg6O0HcUCSBhb816nVb0n@vger.kernel.org, AJvYcCWZtgDqUUtjVKRQPP8Tj5YVqtS3QmMHlH8/wWChS7qDMrk9pzNmPAEmQzRfG/OpD0kyWMrpZejDrMg7@vger.kernel.org, AJvYcCWfOSe2sWDXOSZMjX31z8mDh1AVxnQ8uiyb3Fxt15wa03HIaDPfreLuCgjwp3zf6KBr4q1L8j7qzTzz@vger.kernel.org, AJvYcCX/7aiKZADt8OjcxXtIFiUPJayEMdX3LdPoPxL42JcalSIfSbuW5RAzu7KcsvL72AhkxirEhoJYuMJx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjj1j7ezRyjYSlsq8EvNIo/auYKZy3fmxhJqPzOZ7LVEexguBH
	yIhKCPcqWofCXby0hAOYwMzjR5JUd9CPu8sJaKB7IPIZuj7OPRFCr6IkDAvyEm3Yir7z00rqQvD
	dm9vGJkGc7y+0NcPeJ4V2BKAcbac=
X-Gm-Gg: ASbGncvwHSA7yNQkScOTC3eNYdEmN6stDVrRAyEeyjirSVjlUPNKRs4YKXQo9BKapNS
	1Ui/ILJeGxlUam4DvCOFV0mCct5P+0RwYj9BatHtdc7SwYUOj9cHZB7yFI09yFSuAICDI6lB/7P
	jkzoAtCEeuewrcGqJwEbvxuvK0320l+kPexo/c2fKrWt+iGJ7tPVcBP359oVhzfA==
X-Google-Smtp-Source: AGHT+IGnMl8xXOK57/ZzKZYIgnwfRVgrXn3A0a1Kwuu9Q7lTjYjkK1vli/T0yMUFe8XoUL1LZwGpy5M3nTp+v4hQJ48=
X-Received: by 2002:a05:6214:20a3:b0:6e8:9021:9095 with SMTP id
 6a1803df08f44-6f2c4667292mr342752806d6.32.1745408997579; Wed, 23 Apr 2025
 04:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 15:50:04 +0400
X-Gm-Features: ATxdqUGjK8I-AihCu7CqCFzV8k_TmaGK6QTvYnTbCFcWqCiveCrx5icRlgOhR1E
Message-ID: <CABjd4YyBKcrnnPLjtckq-9DJ1ozW9cpEkUn_hu2ExcO-W8CDMQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: i2c-wmt: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:21=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Rewrite the textual description for the WonderMedia I2C controller
> as YAML schema, and switch the filename to follow the compatible
> string.
>
> The controller only supports two bus speeds (100kHz and 400kHz)
> so restrict clock-frequency values accordingly.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
>  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 48 insertions(+), 25 deletions(-)

Dear all,

There haven't been any review comments on this one. Shall I resubmit
this patch separately from the big series for easier merging (perhaps
also dropping the MAINTAINERS update until later, so as to minimize
conflicts in linux-next)? It doesn't have any external dependencies,
and the binding itself is rather boring/trivial.

Best regards,
Alexey

