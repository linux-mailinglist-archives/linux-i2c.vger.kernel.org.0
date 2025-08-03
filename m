Return-Path: <linux-i2c+bounces-12124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2621B1944B
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 17:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99F547A88BD
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 15:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45757263C75;
	Sun,  3 Aug 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="T8psHE8Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD44D2135D1;
	Sun,  3 Aug 2025 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754233508; cv=none; b=aFcKAqgz0kAnhi19thfn73zljFfMdWCWtq3nqOdQtLPWUmE3BSZ9m7jYKO02JAsF/bQHLNrU4S/78ov/rrlW++yq5GiVF8nCGOaVCiRkVa3plNZq+6YrIA7MmQCYMXwwqwB4W/d4ue5k1D9lYFKskteEnJdE6++uEYWXF7D0hgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754233508; c=relaxed/simple;
	bh=OH6YF8FiXmSYhvu7EJplLSIouAgtZdbCXGQqbyIxTM8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QXy2aO205ggxqlnt9l1dklfB4Kgqi17MAUj5zxHfOn0+vUEUURzDK8pBzuMrIoIHnnMCkiKe6iPWgWA8dJroIb8By4rqulfSqo59rnCyQMvvIILTKsPbde2xK+h0C/ns2NOr6iQFE2K10RaeXEyKeVRXRJCpa5auvpby9GCecVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=T8psHE8Q; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754233497; x=1754838297; i=markus.elfring@web.de;
	bh=/Kvbyo/sy5tf7ikvUPDsD/waiKMUGdAohotFADXAbEU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T8psHE8Q5yOJkQv/609Mzaatkb0qyW58foGRUD2txDlgd4FroP+3Nb0hGpJYPouf
	 YLA/XDDpbqcQ//ZahNgmVjM9XkrAUJgeHYdk/nxRMEOxfaS21xFXHB50GQPrNyY17
	 ma9uOtcB1QhecS8DA1/or9sBZy0daIHeg92YSpPr/Q4dVNzRuWSdcoxOPnSXxj+/Z
	 Ir3dtNpQz326PBwIhfp9581xAyvUOaB19Urva8Y/cbdzJK5N6sDpCEgAaETaOkHMp
	 10P+WoWo1FzowNOWwNLqwMAHNs7mr5a+XV41Kv5jfUlenyjLHNClattyevEoZpwfK
	 JcC7VWsSSJdnsxuZrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MT7aV-1v4kWk2CcR-00NcaC; Sun, 03
 Aug 2025 17:04:57 +0200
Message-ID: <4d23e99a-5795-4d1e-97eb-3b49e0a88970@web.de>
Date: Sun, 3 Aug 2025 17:04:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Elad Nachman <enachman@marvell.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>
References: <20250803101507.659984-1-enachman@marvell.com>
Subject: Re: [PATCH v2 0/1] i2c: mv64xxx: prevent illegal pointer access
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250803101507.659984-1-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yg0c7TTyZYEbHnqEW5eOTmEZf+fXVeW9ooehmpOcPhADeRihZDK
 r+q5Hby/1YajSXU1VsD4mVOYIQgSpkJbZawyFelySMLkOGaRIl/2NZ0/x5JTHcICfBys3p0
 PyYq/tu5NISPu1S2cuA6SJjZvI8qWfKKoiAu7tayolB+rwqYfPeQuycmnBzMTpXLE1Iapqb
 qJR+aEuFYJpNVQ4TaQ3fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T9AD6RvMmOk=;a2Y1UWdPC/E8zZBJsxJpVCjTUFD
 2S1+tToB8gYkV8RWHeIv+7WLY1ebEpCrK5XcMj5l5NK6uVz2SMONnecEfPQUWPOS1fzClRQA5
 /L1TYASbZCdFlUTOP4hi4AIhDhVCmwMelmN8aUhHNGkOY+Ev/xiBnG8zfor4Pynv3mIypOeXn
 W5NtwuBSmhXsQWiuriCoBoRvP59OjpS4gsTUCSn/+8j9KZv4e8hm2lhqJejNvQTJd0UDFQ3tC
 0oPmudpX6TfAtoNC0CI9KJ5OVhJ7Hk6F/nL2LfW0E4LPLKXy4tXw/8oDQWMNSUqVfEEtBhu2g
 G+wbTTFqU3QwrZbh0vlnBhbp9xZV+ua5ldY1D6Le8NT11Qd75OP04vA3l/KZacVDSbZqpNjkv
 Gr3aPgIf7TMezxYNhshoEAPTpEsuV+ibbszSquQ+OelzQ5L8KYEsOMsAF6vazVA5axpoAHUIq
 QpxPJvnPi+Vmm0o16td53ymIY6trDFZtFuKdKJVxPFRZ59j1+B8y/Gd6DiUj+QZ0FPlvdct2P
 Fd0W879A5Fv4ZzKQk7XnS8JWHeociS5aeEDtyTRJm03linzHi7M0UnkhKqHBVQSSY9fu4H3hZ
 EXiC2kPIMNcwRZrKH1EKMEWI0BOf9Q42GTg3fr3lbQLLGUUMrpeUihE+UnZuzLQBxXlhApCJp
 It192yaPXp/Sg2hMj6jp3dt9cMyLY5U7lcKHSxJB1r/Xz1l1WDh7L3DPwadxjXqj8sAlICgcc
 OuBc/XuFyG3p4AtPv5F5U7mgpIk8d9F3dFBvTFj0lEk9ipxRZI7on4XjWyCOWju2Ip0ACLOyE
 VA7hoES7St3Hz7KN16aDpiZo2WN6EYQWWVcvmrGRv49CKFEh4V7eunIiIRQXxQrG1WtWWVi/C
 EaRziI+zgjFqUilaC7xuNMYX3crHh6dYQKk8Rl63/tLJk6UhiSppb7GJkPzebCwuhNPXxZ6qU
 VTIX2YrRSHg2XxQKmEv4hFhA2xIo49542vsYk34J12wQcjp2mC6dJ8xUb66ifTCZEyR4R4NNZ
 KgK7AzJeKXWbcmSgPvr/j+ojDKxHiFsrjxo6lOVrjM5VdDY+ffWlMRrwRxgtMa+RcGplHYRlb
 T+uusw4x8+SputDFFwRCswSs/+Z/ZxD9NK/GzdQ9b3xvwZEbUBBoM2v93HE0PqexCIK+pnJ7J
 2uPXuJujN50jhdTy75YH9zqTPFF1TVsOZ08YCheTvCUmgJWkH1v1umwOoBOLi14Fxy7ErPA54
 qsgeu8s8W2UV6JfbRDhohGSIYxdc80/m0ZZMig1kSvrwbhEJxp1cTXUMMYg86DyUemthnUUHQ
 W9DSsFFH0Wl3YtUzqtg/8sTJdiFnND707GWbK/vAZGWxvK5gWRWssX4nScjOKqz80YXfobfiy
 MWgVQu9ynnJnzKFZJ6it0UjBcsaR3CPKJYWbFydJwbxK5KEe4SMbI/SZ0yqAg0gPgTa3ZG/8D
 7PBptUq6LkV679Jk/QJZ5htVH8NNrtZD1r4E8EQeT7PPffo7VCJXVeLCZpnVVEgPb1HQ/PsVJ
 mYYkamcWLAQ71b+oLmSlkhwLM7lV9VLhdxyNlpiHbZKLMvRo81O1k8HnkuLQOWD2T667nH3Dz
 kdt8ank8sv3nBOzZlhMtomwjTcaNz7l+ONJCvW9Ojo8uUWo0FgO2X72pJp9wTadxoudq5JutC
 XVf8dy3D0Z1GCIVWg2tmvQPcd5XuENvHPdV9eYxz2xsWFsM93jWzyhALWd4x0vvfeUkdxqIWD
 qQ8+3KFnQCZHf4cGLrb23IvA+bzhXun3zpxxeTavcQEYWDL1Ydr0Dqdb8kF7AA+UnaJk6pv4I
 UewpyqotTt3D+kA45kVefCXR8yIviQsIAWtI5MjUqSrthCoxus37rjv3SFW3HfmtkJG5LAqPC
 cIKvqE9P4bTUBeweVjbGezByg+xTUott11S4Wy26FrsD2GBI1ey1NogLG0ttIK2iH+1whL9P+
 z3HnEznOt0AIYT8Kj1kvXczRAMVGd+vYnjNLfFhdxU5qGRd23QffEiDmsa+e3vF+lLPwJ8PHN
 S80QwZkpuIuDNuNRGE7UgGVTVtSjk3SPTqOmUozIEdcmxpmUYFxtFyVsOjmDxlHrjVOrbp6T7
 4HWtdQ/Ep/zVllqo6KRlO5gVqJ5HYW6s4wIcDluEF6phioSKGnRcgqrBk+1MQDG/HE+aufG0u
 GoxQ75G1RT4wK4wK9MvKDkU89T32NPHkwKv6oW0/7ME9pIDi297LAMP8XVOPZ+A2WfcEvZz24
 IERAsxSB/YsTavNtcw4qrc/CxEM6rrrhhaYeWOQ/V8qpJOdcT2nV6URDvl2/a5C8MMyezVtET
 G94Kum/yilFvHkp2STdGA2wVSNRxJARH3PIeD6VTKVjYtVe3WtpRlAJ5dpjX16lNgRj9O9Kqa
 X27aHC0RDd/DMj2WVuCs9ix6mfnseCXRdR+Rl+DVCCr8KF4+sMwQzjEoBLahx6Trr8vS41mlf
 ENSpBEAwbbpL0vdyJsiK+mAX5eHsdTw3AnlS+6Um4DS5334os4ksmqbWAFhGHsb2kN34ZtwSi
 P2qCz4ZguHRpp9SNF8zdCyAPZZ5cfdfSrwwlkAqQNYIm5Ylb/5OWvUxHBjYVpPqwkle08+trl
 MOsXIhnzYcagLAKBfQkDlY/ye4M8Y22oqipG6p2XczgnAwQsFsOgcS3/VX/2ldfK0CZ2nTizE
 6yEE3mlUh/ssOikSgohxNK495pX3YXJ66F2d1J8skReKbE9gFZnr5XIvlrHMrVYhLyIFsG+cC
 FlZA7HB7Rgx+TNnBO6EUVKN53YhNK0y5p5EFki13E97kc4i/M4vnLkwLVKnLWduy3U41lMrzG
 enEkoL9PY/APxX/MAsKZ0AW/WO2OL170O68f+LJYP9pUZ8cXsy4XoZ7IVuNv41MMG1iX4X0Uz
 tU2D2tSLijjO2DRDsyvoNKk+UR0jXkOdlJ+bqf7qAQDXXjeL3U4clnT5t9kITOqwpml+4tmFT
 afKH/3J3pIHI6edGUFzkBZrLdILc8HEF889e4ao73WfQ2qbOrsYZCqs7XxC8zI4LFJ7OAu+ta
 tM28Jwgb40CZMbpQhy/sbY2xy1NcPzLsTcReO5wHBvH38xR0jBfU7y0mzOOUS/vy10oWcJrzi
 u6/Get3SAyQIkC4UcCR9XknPy0BKIv5C0B+mo7FiWGDSXqqi9dHsOtIOvbvQQOappjIP8UTUI
 A/Ev9oDSditUivYNjMJQq6eOHOLFpfjNzfaeALxCjH/9yApqNDPuB0Y0+AiYRWge8MkYnG7Vk
 Cs5IYNz9KdonLQo7JPrdV5m2iEt6/+Ih7Tk5lxUC76ZSVCa1SGCrsP5l1miDk6jP2MruFOc/7
 n7EqxYz+oyexjYUa/D/JzgEli5LZ89Iy/RZXx32MUqQrR0Y89eCmwBJOnKbyEx+0F+f+I9GkV
 U8cVPQKSj5cVCXANEj5DbfIxpjanefTeDONhFrmvsvBipc5TeWs0UslZn8m2KFzRvXMsAwurr
 qyW+MjdUI899hZVbj0WywoDCGGXONv7gxWNjpY/pqcvm7ct5ddlGn

=E2=80=A6
> v2:
>   1) rewrap commit message
=E2=80=A6

You may omit a cover letter for a single patch,
don't you?

Regards,
Markus

