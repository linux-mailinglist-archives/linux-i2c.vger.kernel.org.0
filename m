Return-Path: <linux-i2c+bounces-1852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC3859867
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 19:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0522281530
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 18:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056376EB75;
	Sun, 18 Feb 2024 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b="KU5dTA2c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DF6EB6F;
	Sun, 18 Feb 2024 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708279500; cv=none; b=nRn9/UMywa12faunoG4dOI94hYPa0G8tSiagW54/7adhkVcYcreLgc/lLx2o60BNNFQbBo7zbp8/t270sWBIDbyrJYsD470JVjaSqGwSBlRm22f7SdY3LJA8oXUWXniM8NXYzA7CPH0yi9yxgsQeiew73P17wi1a7VovnuWCQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708279500; c=relaxed/simple;
	bh=5MARVPLS4o3q4IKyvSWykCpIJv6thdbgJck2sItVAhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AXrC7AIJNN0XoLLmuBScN6eNN7llqSkmlMLM+XCSCh1r2StWXKaCM3Ure4ENspsejU1pQNbxhM38UiUCajxosEtDFGpZ/EXOebm1CLJix+P0ZbMTleFnjz5zzKwPYM2TDqcTMj5HW3xfkZQMkuCELJSBjRYjllkjLQkAzA1CqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b=KU5dTA2c; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1708279484; x=1708884284; i=hoehnp@gmx.de;
	bh=5MARVPLS4o3q4IKyvSWykCpIJv6thdbgJck2sItVAhY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=KU5dTA2czWQndrIsnkL+gWFz7uwBHY6AqYVnCbYhPcE2PJhBJPhWMepY38ds9Rds
	 M+J3YJR7IXVrMTDUTi8JwcsUgBVuecjIIR7JQITG9a2oY6vadBaMD155PRZzPXi9h
	 1Jw0hP2n/Da5j0P5jFcUjicvKSO203IL6YyTAvmhBNhuhuUK4GgQVuK7odTFpoQqS
	 jtTBZetqRh6+7P1QBJyu3BtnLGA+8E2e/nx9xx/fqKKz1JTp7PKcaEgpVv1gqxuAY
	 aLcXu6BgnXtJDuZDGe6QqH9rmfjZGiEVXcWvxDQAZoI6sMsQUJUabro+D9kPJ96Fi
	 aABvYmht604SL2px4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from patrick-dell.fritz.box ([31.18.173.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhD6W-1qxlo941FC-00eL5E; Sun, 18 Feb 2024 19:04:44 +0100
From: =?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Add lis3lv02d for Dell Precision M6800
Date: Sun, 18 Feb 2024 19:03:59 +0100
Message-ID: <20240218180400.10413-1-hoehnp@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ng78jh5TjUxHmSpsFDhiW+G4LLPyp9kz8OHvXmCGOrQuuwWrnfB
 9ayyKtIyAKjUzFiV5o+MCgTDyqeYBHM+sdGdXnBFLaNrTgLMlkT2R8/nKWuCRkDABrhSumc
 nPsqdyXE5L1iGBEhQ/QZKFV2qZlYoFaxfBFe7UMBT8XT7bo89qILZ6zTIv1pNGiNUdPhVaZ
 V0ley8fbZhTKJzgsQVXNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LmhsTY59fb4=;rahSXbPTZ7niqXbDE9OVLFzSjI1
 7FmwSMdh10xNuxIYZv9Nmk2p7kiUxntXr/KvY5Hb0Ijp9H/1CYAIY9Gxz1KAayrNYe39QtdRe
 u1FJM2T53sheAvIR34B4et36fnpjdVG7CjWsh8Q43gOZg2DEqLZAP/j63if7t4M4TDRqgcvKr
 jES36OtEqqBzdLNOgU8nAU5q7L0WKWlz9aZE6rejzF777SCbNM7ZH/EqGWj0+3RazIQAYdTDX
 ylXyxC7yKFm4n1EgxtFqsHKhAnuYXMpOXvkuduoQT+2a2aD559UcHZcb7+VpOFA4rg+wcc3ET
 mGqbZ3NYMGjBgUMvm6Vq4VxM61+oW94cloi8phUtVfmzeILUNXVeEqa7DQd6cvFBpJMUaSlfP
 fO1A/n7SvXWBca3kwDjng6Pszdbixx0XaLPJtJsTZ9e/Z3QIQx64uFVIqkj7+rD5HXoqTMtxJ
 skGf3We57AXSGP6sNceh9xErAvAUilRW6Cieug0TSCtb4/qEQ1iilL/WTbIvwcGpp2pObc0lF
 0Tw/l7WHLx+S0CIEmYxqN1M6IvOSaPvka7GfsVlfiPL2Rh5p9aSuPnBJqX3QlHMIoeCUAz+k0
 xsMzvQutJiK/b3VXAj8HEPTCWCiP196Xxv/GYN4PUHe762Nt7cCYSvIJ7mY3oAkC9c+pHRKod
 k/RqOlovEPaInc/XDlBnlj3lh5nyWhJQKOGyIH13RDB1sJs4ZuSCPa0ZrIsT2SxwB7PE/ooZI
 KVVrxaQkOBTbikcLCY0+k5pdxNk+a7mRU93Yf6HZLzU8FTXOZj8IkfqdMmpX3EZrddlXmVezb
 B9xMtobJMkNDU5xwT1qVXGecxlW/BO/G7wqGI/9BG0jCg=

Signed-off-by: Patrick H=C3=B6hn <hoehnp@gmx.de>
=2D--
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2c36b36d7d51..ba699db27f58 100644
=2D-- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1234,6 +1234,7 @@ static const struct {
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
 	{ "XPS 15 7590",        0x29 },
+	{ "Precision M6800",    0x29 },
 };

 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
=2D-
2.43.0


