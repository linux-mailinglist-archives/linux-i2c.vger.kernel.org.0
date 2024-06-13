Return-Path: <linux-i2c+bounces-4007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A364906454
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 08:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8096F1C218EA
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 06:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57E8137746;
	Thu, 13 Jun 2024 06:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZscDM31Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD562119;
	Thu, 13 Jun 2024 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718261225; cv=none; b=lOXdsqEEUSNg0yV7ZV+hnXlzSx3kxX0RyEUXA8c9ljrb7/0c9cyN0tABi0xX96/7y5GWBF1NRALll+GGrlDU9So84tdJmnwxhFpFLi5x6Uyf0jSG8CQZiObDRHAM8lFVLoaszAIh7Qm3OmfuDDJjY8yPPO8Ml/gP678sG5sQQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718261225; c=relaxed/simple;
	bh=fPVczjN6QqloCDP/VCGPXgoE3JwqY0vu//dwIeh6Nn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHJZjuOhDKuhmGXl0uo6hr3cwk1vRQddEOcJ/U+mFTNVlDuGWjRNW7IWVw3E4LIvzdi8VzydLJJOqPmqtEupgcztm+0gb2X8QkkeYJDTml1yuz+XG1rzVVVclKjSoX05OzUgMp+v1Ngn0fUGEVgRZo+b+AsJyDmV+PXjBe4uqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZscDM31Y; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718261195; x=1718865995; i=markus.elfring@web.de;
	bh=fPVczjN6QqloCDP/VCGPXgoE3JwqY0vu//dwIeh6Nn0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZscDM31YM9VdKaZDF3/78lZqwhU/0DM6/P5LlyA851Ik9qCwj1/hcDqnPQIX4AHV
	 j5lJ9rD89fJ6TtkNuE/41cGsnU/knLdDhs1/5D8l9BapufQDth9DqWFJNIQChGIR8
	 8AoiBLstAf9MN3YneDYPfdymoFdT4E3DeTKp/Y/jM5L0FXJIGkEmq4eFgHQboXTu5
	 xRjBD0vuOuvzaF+HjG8fcMMd9IToSKg+2pKHmro3LuoVDH0c7w7UexZwlCoCHrtbd
	 ifs/rztZkHGWo7yKmArEeJc928CpIDDjhr7Q8fGizAh2Qh2+ki/XuxRNsvYzYpWkB
	 TryFa47+vjqehfTuJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2gkf-1sGHJc1VN9-00FHht; Thu, 13
 Jun 2024 08:46:35 +0200
Message-ID: <77970d8c-503d-4ca2-af7f-dd50ee1c9bc5@web.de>
Date: Thu, 13 Jun 2024 08:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: octeon: Add block-mode r/w operations
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
 <20240613025412.3848629-3-aryan.srivastava@alliedtelesis.co.nz>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240613025412.3848629-3-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U+VonU8sDHW799I/QZw30s3qh6WLautldqzyfOo3puqWoezz/El
 NHf29vIq7bWLc2yDuLUjU8PeZ3kmB1IQ+2K2XRgkJl8xbZudmrhHeM7OSvETlp8p7egbb2d
 6llAs//ktD6bu/H6tlGUCazvw/jdULKLPfq0UYEHy+ohrsMrHaLpTdcJeDEIIp6lURMCZbo
 d14XySZaohHpqfRGtFecg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fm7PBpq/fpQ=;3IgQLR93+MK87XzZvhi5OoYfhdk
 IidE/i4Kt/v81gUBn4Z75hSJZNPiZF4hcuMz3PnsSK327EZRmnQ+nNz5hCE5iNi/zGMzGDHgN
 lQbWP9XaiAc6qTk/jLw0NZ7xVVPPcu9oS9ajAMCGUOSEA0HPkFsgrasRjRJTp9tgd4hiAJ8c9
 ztvuATLS+WDdn4W9ij1naHelXvSeJLyT4z+2sZBdHHF/VIChXmqfNoIxk9ZW3FPaReRzuV25H
 /QPo4xIVPg7nMmPksQ7DL0lX6e0V+ilJ6T3Nthz8eJYTOzRwBmBNpsYi8mLI24rkZyTjJpIN6
 /t2u4UGxvgp1usX9mdSM7SUpAL7tdvGVxPCKsWs1Ac5wlHZ6ML8rRxg/6oSLge4Fn61Nu3HnH
 TNh8Yh2IA5Ik467qz5/ozHrICsP/AYSkN1CWjRW7on4+pyzSaRvyAnYIQMEyGSlDHFyLrhdQ1
 5mLr2/JM5FqSKPHL3sPzh27v73MWp4uROkB/eoqE+34ccBFatHxpcLCzX8ub1AzKXFNM9E6xr
 LnZaiznxJZcl9YMzJ3BNeT9gv3ZnCTu8ENKil03ZXucDx89SUd2eWMJiJm7dklD7rq9nc/aVu
 a5jMR9u3aOr6gKXRrAc/R8+2aBuner+S7dSxyoI9Zk5b0sBa4P3OCLT1Mr1i/FmO3VuyyF8tk
 5wEiKMjm07O9YeEtWfKWvFBJUPg7IuiSM9HltDEIPBxK276AApiCBb1h39EID77T9TwoooDWP
 JL+T+y4qAVgzLa4gaNjB1KhOTQlL0kMNpKLWUI+6v3Nl6rWtl0SpLxJUP0w/zHJ9LguYKKc7F
 j8p1I6vwky8sbYtVpQAX0dQl9FMaRDofce4mcFajqLOr0=

=E2=80=A6
> mode is the usage of separate FIFO buffer to store data.d
=E2=80=A6

Will a typo be avoided for the final commit message?

Regards,
Markus

